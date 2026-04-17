from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


ROOT = Path(__file__).resolve().parent
ASSETS = ROOT / "assets"
SLIDES = ROOT / "slides"
OUTPUT = ROOT / "symbiotic-ai-pitch-deck.pdf"

WIDTH = 1920
HEIGHT = 1080

TITLE_FONT = "/System/Library/Fonts/Supplemental/Arial Bold.ttf"
BODY_FONT = "/System/Library/Fonts/Supplemental/Arial.ttf"

WHITE = (246, 248, 252)
MUTED = (173, 185, 207)
CYAN = (120, 231, 255)
GOLD = (255, 213, 122)
PANEL = (10, 18, 35, 210)
PANEL_SOFT = (10, 18, 35, 170)
LINE = (132, 166, 245, 58)


def font(path: str, size: int) -> ImageFont.FreeTypeFont:
    return ImageFont.truetype(path, size=size)


def fit_text(draw: ImageDraw.ImageDraw, text: str, font_obj, max_width: int) -> list[str]:
    words = text.split()
    lines: list[str] = []
    current = ""
    for word in words:
        trial = word if not current else f"{current} {word}"
        if draw.textbbox((0, 0), trial, font=font_obj)[2] <= max_width:
            current = trial
        else:
            if current:
                lines.append(current)
            current = word
    if current:
        lines.append(current)
    return lines


def draw_multiline(draw, text, xy, font_obj, fill, max_width, line_gap=12):
    x, y = xy
    for line in fit_text(draw, text, font_obj, max_width):
        draw.text((x, y), line, font=font_obj, fill=fill)
        box = draw.textbbox((x, y), line, font=font_obj)
        y = box[3] + line_gap
    return y


def load_background(name: str) -> Image.Image:
    image = Image.open(ASSETS / name).convert("RGB")
    return image.resize((WIDTH, HEIGHT), Image.Resampling.LANCZOS)


def add_overlay(base: Image.Image, strength: int = 168) -> Image.Image:
    overlay = Image.new("RGBA", (WIDTH, HEIGHT), (5, 10, 18, strength))
    return Image.alpha_composite(base.convert("RGBA"), overlay)


def add_panel(canvas: Image.Image, box, fill=PANEL, outline=LINE, radius=30):
    layer = Image.new("RGBA", (WIDTH, HEIGHT), (0, 0, 0, 0))
    draw = ImageDraw.Draw(layer)
    draw.rounded_rectangle(box, radius=radius, fill=fill, outline=outline, width=2)
    canvas.alpha_composite(layer)


def title_block(draw, eyebrow, title, subtitle):
    eyebrow_font = font(TITLE_FONT, 26)
    title_font = font(TITLE_FONT, 98)
    body_font = font(BODY_FONT, 38)
    draw.text((120, 104), eyebrow.upper(), font=eyebrow_font, fill=CYAN)
    y = draw_multiline(draw, title, (120, 170), title_font, WHITE, 960, line_gap=6)
    draw_multiline(draw, subtitle, (120, y + 28), body_font, (232, 238, 252), 960, line_gap=10)


def bullet_block(draw, bullets, x, y, width, size=36, color=MUTED):
    bullet_font = font(BODY_FONT, size)
    for bullet in bullets:
        draw.text((x, y), "•", font=bullet_font, fill=GOLD)
        end_y = draw_multiline(draw, bullet, (x + 34, y), bullet_font, color, width - 34, line_gap=10)
        y = end_y + 18
    return y


def pill(draw, text, x, y):
    body_font = font(BODY_FONT, 24)
    box = draw.textbbox((0, 0), text, font=body_font)
    w = box[2] - box[0] + 34
    h = box[3] - box[1] + 22
    draw.rounded_rectangle((x, y, x + w, y + h), radius=999, fill=(9, 18, 34), outline=(110, 147, 245))
    draw.text((x + 17, y + 10), text, font=body_font, fill=(220, 230, 252))
    return x + w + 14


def make_slide_1() -> Image.Image:
    canvas = add_overlay(load_background("hero-symbiosis.png"), 112)
    add_panel(canvas, (80, 76, 1040, 770), fill=(8, 16, 30, 186))
    draw = ImageDraw.Draw(canvas)
    title_block(draw, "Pitch Deck", "Symbiotic AI", "From stateless assistants to AI that learns how you work.")
    x = 120
    x = pill(draw, "Durable memory", x, 490)
    x = pill(draw, "Behavioral accountability", x, 490)
    pill(draw, "Action across sessions", x, 490)
    quote_font = font(BODY_FONT, 28)
    draw.text((120, 610), "Simple system. Compounding context.", font=quote_font, fill=(205, 217, 239))
    return canvas.convert("RGB")


def make_slide_2() -> Image.Image:
    canvas = add_overlay(load_background("problem-fragmented-context.png"), 150)
    add_panel(canvas, (70, 70, 1120, 980), fill=(8, 14, 28, 205))
    draw = ImageDraw.Draw(canvas)
    title_block(draw, "01 Problem", "AI is powerful, but still forgetful.", "The relationship resets every time.")
    bullet_block(
        draw,
        [
            "Every session starts from zero.",
            "Valuable context dies in chat history.",
            "Generic advice does not change behavior.",
            "Most tools assist for a moment. They do not adapt over time.",
        ],
        120,
        430,
        900,
    )
    add_panel(canvas, (120, 760, 980, 920), fill=(255, 213, 122, 26), outline=(255, 213, 122, 80), radius=24)
    quote_font = font(BODY_FONT, 34)
    draw.text((156, 805), "The problem is not intelligence alone.", font=quote_font, fill=(248, 237, 210))
    draw.text((156, 852), "The problem is that the relationship resets.", font=quote_font, fill=(248, 237, 210))
    return canvas.convert("RGB")


def make_slide_3() -> Image.Image:
    canvas = add_overlay(load_background("vision-runtime.png"), 136)
    draw = ImageDraw.Draw(canvas)
    title_block(draw, "02 Insight", "The missing layer is durable context.", "Symbiotic AI turns one good conversation into an ongoing operating system for human + AI collaboration.")
    cards = [
        ("Memory", "Patterns, quotes, commitments, and direction survive across sessions."),
        ("Behavior", "The agent challenges avoidance, not just validates whatever the user says."),
        ("Action", "Code, writing, research, and automation all happen inside the same live workspace."),
    ]
    x = 92
    y = 600
    w = 552
    h = 292
    title_font = font(TITLE_FONT, 38)
    body_font = font(BODY_FONT, 28)
    for heading, copy in cards:
        add_panel(canvas, (x, y, x + w, y + h), fill=PANEL_SOFT, radius=28)
        draw.text((x + 34, y + 30), heading, font=title_font, fill=WHITE)
        draw_multiline(draw, copy, (x + 34, y + 92), body_font, MUTED, w - 68, line_gap=10)
        x += w + 28
    return canvas.convert("RGB")


def make_slide_4() -> Image.Image:
    canvas = add_overlay(load_background("hero-symbiosis.png"), 180)
    draw = ImageDraw.Draw(canvas)
    title_block(draw, "03 Product", "A simple system that compounds.", "The agent reads four core files at session start, then updates the workspace as it works.")
    cards = [
        ("SOUL.md", "Defines the agent's identity, tone, and values."),
        ("USER.md", "Captures the user's mission, psychology, and working patterns."),
        ("AGENTS.md", "Sets protocols, interventions, and operating rules."),
        ("NOW.md", "Tracks live tasks, deadlines, and the memory log that grows with use."),
    ]
    card_w = 398
    card_h = 220
    positions = [(92, 520), (514, 520), (936, 520), (1358, 520)]
    heading_font = font(TITLE_FONT, 34)
    body_font = font(BODY_FONT, 24)
    for (heading, copy), (x, y) in zip(cards, positions):
        add_panel(canvas, (x, y, x + card_w, y + card_h), fill=PANEL, radius=26)
        draw.text((x + 26, y + 24), heading, font=heading_font, fill=WHITE)
        draw_multiline(draw, copy, (x + 26, y + 88), body_font, MUTED, card_w - 52, line_gap=8)
    return canvas.convert("RGB")


def make_slide_5() -> Image.Image:
    canvas = add_overlay(load_background("vision-runtime.png"), 164)
    draw = ImageDraw.Draw(canvas)
    title_block(draw, "04 Differentiation", "Most AI tools optimize for a better answer.", "Symbiotic AI optimizes for a better ongoing relationship.")
    rows = [
        ("Challenges", "Designed to interrupt avoidance and push toward the user's real goal."),
        ("Remembers", "Persistent files store history, patterns, commitments, and self-knowledge."),
        ("Acts", "Not just advice. It writes, researches, automates, and produces output."),
        ("Evolves", "The system improves as memory accumulates over weeks and months of real use."),
    ]
    y = 430
    heading_font = font(TITLE_FONT, 34)
    body_font = font(BODY_FONT, 26)
    for heading, copy in rows:
        add_panel(canvas, (120, y, 1800, y + 126), fill=PANEL_SOFT, radius=24)
        draw.text((154, y + 24), heading, font=heading_font, fill=WHITE)
        draw_multiline(draw, copy, (420, y + 26), body_font, MUTED, 1320, line_gap=8)
        y += 148
    return canvas.convert("RGB")


def make_slide_6() -> Image.Image:
    canvas = add_overlay(load_background("vision-runtime.png"), 118)
    add_panel(canvas, (84, 90, 1160, 930), fill=(8, 16, 30, 178))
    draw = ImageDraw.Draw(canvas)
    title_block(draw, "05 Vision", "The future is not assistant software. It is symbiosis.", "Symbiotic AI is the memory and behavior layer for the next generation of personal AI systems.")
    bullet_block(
        draw,
        [
            "Persistent instead of stateless.",
            "Specific instead of generic.",
            "Collaborative instead of merely reactive.",
        ],
        120,
        510,
        940,
        size=38,
        color=(226, 233, 248),
    )
    draw.text((120, 820), "Symbiotic AI", font=font(TITLE_FONT, 58), fill=WHITE)
    draw.text((120, 888), "A durable workspace for human + AI collaboration.", font=font(BODY_FONT, 30), fill=(210, 221, 243))
    return canvas.convert("RGB")


def main():
    SLIDES.mkdir(parents=True, exist_ok=True)
    slide_builders = [
        make_slide_1,
        make_slide_2,
        make_slide_3,
        make_slide_4,
        make_slide_5,
        make_slide_6,
    ]
    images = []
    for index, builder in enumerate(slide_builders, start=1):
        image = builder()
        path = SLIDES / f"slide-{index:02d}.png"
        image.save(path, "PNG")
        images.append(image)
    first, rest = images[0], images[1:]
    first.save(OUTPUT, "PDF", resolution=150.0, save_all=True, append_images=rest)
    print(OUTPUT)


if __name__ == "__main__":
    main()
