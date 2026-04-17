from pathlib import Path
import struct


ROOT = Path(__file__).resolve().parent
SLIDES = ROOT / "slides"
OUTPUT = ROOT / "symbiotic-ai-pitch-deck.pdf"


def jpeg_size(path: Path) -> tuple[int, int]:
    data = path.read_bytes()
    if data[:2] != b"\xff\xd8":
        raise ValueError(f"Not a JPEG: {path}")

    index = 2
    while index < len(data):
        while index < len(data) and data[index] == 0xFF:
            index += 1
        if index >= len(data):
            break

        marker = data[index]
        index += 1

        if marker in {0xD8, 0xD9}:
            continue

        if index + 2 > len(data):
            break
        length = struct.unpack(">H", data[index:index + 2])[0]
        if length < 2 or index + length > len(data):
            break

        if marker in {0xC0, 0xC1, 0xC2, 0xC3, 0xC5, 0xC6, 0xC7, 0xC9, 0xCA, 0xCB, 0xCD, 0xCE, 0xCF}:
            start = index + 3
            height = struct.unpack(">H", data[start:start + 2])[0]
            width = struct.unpack(">H", data[start + 2:start + 4])[0]
            return width, height

        index += length

    raise ValueError(f"Could not determine JPEG size: {path}")


def pdf_bytes(image_paths: list[Path]) -> bytes:
    next_object = 3
    pages: list[int] = []
    objects: list[tuple[int, bytes]] = []

    for image_path in image_paths:
        width, height = jpeg_size(image_path)
        image_bytes = image_path.read_bytes()

        image_object = next_object
        content_object = next_object + 1
        page_object = next_object + 2
        next_object += 3

        image_dict = (
            f"<< /Type /XObject /Subtype /Image /Width {width} /Height {height} "
            f"/ColorSpace /DeviceRGB /BitsPerComponent 8 /Filter /DCTDecode /Length {len(image_bytes)} >>\n"
        ).encode("ascii")
        image_stream = image_dict + b"stream\n" + image_bytes + b"\nendstream"

        content_stream = f"q\n{width} 0 0 {height} 0 0 cm\n/Im{page_object} Do\nQ\n".encode("ascii")
        content_dict = f"<< /Length {len(content_stream)} >>\n".encode("ascii")
        content_bytes = content_dict + b"stream\n" + content_stream + b"endstream"

        page_bytes = (
            f"<< /Type /Page /Parent 2 0 R /MediaBox [0 0 {width} {height}] "
            f"/Resources << /XObject << /Im{page_object} {image_object} 0 R >> >> "
            f"/Contents {content_object} 0 R >>"
        ).encode("ascii")

        objects.append((image_object, image_stream))
        objects.append((content_object, content_bytes))
        objects.append((page_object, page_bytes))
        pages.append(page_object)

    pages_bytes = f"<< /Type /Pages /Count {len(pages)} /Kids [{' '.join(f'{page} 0 R' for page in pages)}] >>".encode("ascii")
    catalog_bytes = b"<< /Type /Catalog /Pages 2 0 R >>"

    ordered_objects = [(1, catalog_bytes), (2, pages_bytes)] + objects

    output = bytearray(b"%PDF-1.4\n%\xe2\xe3\xcf\xd3\n")
    offsets = {0: 0}

    for object_number, body in ordered_objects:
        offsets[object_number] = len(output)
        output.extend(f"{object_number} 0 obj\n".encode("ascii"))
        output.extend(body)
        output.extend(b"\nendobj\n")

    xref_start = len(output)
    max_object = max(offsets)
    output.extend(f"xref\n0 {max_object + 1}\n".encode("ascii"))
    output.extend(b"0000000000 65535 f \n")
    for object_number in range(1, max_object + 1):
        output.extend(f"{offsets[object_number]:010d} 00000 n \n".encode("ascii"))

    output.extend(
        (
            f"trailer\n<< /Size {max_object + 1} /Root 1 0 R >>\n"
            f"startxref\n{xref_start}\n%%EOF\n"
        ).encode("ascii")
    )
    return bytes(output)


def main():
    image_paths = sorted(SLIDES.glob("*.jpg"))
    if not image_paths:
        raise SystemExit(f"No JPG slides found in {SLIDES}")
    OUTPUT.write_bytes(pdf_bytes(image_paths))
    print(OUTPUT)


if __name__ == "__main__":
    main()
