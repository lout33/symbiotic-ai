#!/bin/bash

# Claude Life Assistant - One-liner installer
# Usage: curl -fsSL https://raw.githubusercontent.com/lout33/claude_life_assistant/main/install.sh | bash

set -e

REPO_URL="https://raw.githubusercontent.com/lout33/claude_life_assistant/main"
TMP_DIR="/tmp/claude_life_assistant_install"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "Downloading Claude Life Assistant..."
echo ""

# Create temp directory
mkdir -p "$TMP_DIR"

# Download files
curl -fsSL "$REPO_URL/CLAUDE.md" -o "$TMP_DIR/CLAUDE.md"
curl -fsSL "$REPO_URL/NOW.md" -o "$TMP_DIR/NOW.md"

# Detect installed tools
CLAUDE_CODE=false
OPENCODE=false

if [ -d "$HOME/.claude" ]; then
    CLAUDE_CODE=true
fi

if [ -d "$HOME/.config/opencode" ]; then
    OPENCODE=true
fi

# Determine install target
TARGET=""
TARGET_NAME=""
CLAUDE_FILE=""

if [ "$CLAUDE_CODE" = true ] && [ "$OPENCODE" = true ]; then
    echo "Detected both Claude Code and OpenCode."
    echo ""
    echo "Where do you want to install?"
    echo "  1) Claude Code (~/.claude/)"
    echo "  2) OpenCode (~/.config/opencode/)"
    echo "  3) Current directory (local project)"
    echo ""
    
    # Read from /dev/tty to handle curl | bash
    if [ -e /dev/tty ]; then
        read -p "Choose [1/2/3]: " choice < /dev/tty
    else
        echo "Non-interactive mode. Defaulting to current directory."
        choice=3
    fi
    
    case $choice in
        1)
            TARGET="$HOME/.claude"
            TARGET_NAME="Claude Code"
            CLAUDE_FILE="CLAUDE.md"
            ;;
        2)
            TARGET="$HOME/.config/opencode"
            TARGET_NAME="OpenCode"
            CLAUDE_FILE="AGENTS.md"
            ;;
        3)
            TARGET="."
            TARGET_NAME="current directory"
            CLAUDE_FILE="CLAUDE.md"
            ;;
        *)
            echo "Invalid choice. Exiting."
            rm -rf "$TMP_DIR"
            exit 1
            ;;
    esac
elif [ "$CLAUDE_CODE" = true ]; then
    echo "Detected: Claude Code (~/.claude/)"
    TARGET="$HOME/.claude"
    TARGET_NAME="Claude Code"
    CLAUDE_FILE="CLAUDE.md"
elif [ "$OPENCODE" = true ]; then
    echo "Detected: OpenCode (~/.config/opencode/)"
    TARGET="$HOME/.config/opencode"
    TARGET_NAME="OpenCode"
    CLAUDE_FILE="AGENTS.md"
else
    echo "No Claude Code or OpenCode detected."
    echo "Installing to current directory..."
    TARGET="."
    TARGET_NAME="current directory"
    CLAUDE_FILE="CLAUDE.md"
fi

echo ""
echo "Installing to $TARGET_NAME..."
echo ""

# Copy CLAUDE.md (or AGENTS.md for OpenCode)
TARGET_CLAUDE="$TARGET/$CLAUDE_FILE"
if [ -f "$TARGET_CLAUDE" ]; then
    echo -e "${YELLOW}! $CLAUDE_FILE already exists at $TARGET_CLAUDE${NC}"
    echo "  To append, run: cat $TMP_DIR/CLAUDE.md >> $TARGET_CLAUDE"
else
    cp "$TMP_DIR/CLAUDE.md" "$TARGET_CLAUDE"
    
    # Append File Locations section based on install target
    if [ "$TARGET_NAME" = "Claude Code" ]; then
        cat >> "$TARGET_CLAUDE" << 'EOF'

## File Locations
| What | Where |
|------|-------|
| This file | `~/.claude/CLAUDE.md` |
| Dynamic state | `~/.claude/NOW.md` |
EOF
    elif [ "$TARGET_NAME" = "OpenCode" ]; then
        cat >> "$TARGET_CLAUDE" << 'EOF'

## File Locations
| What | Where |
|------|-------|
| This file | `~/.config/opencode/AGENTS.md` |
| Dynamic state | `~/.config/opencode/NOW.md` |
EOF
    else
        cat >> "$TARGET_CLAUDE" << 'EOF'

## File Locations
| What | Where |
|------|-------|
| This file | `./CLAUDE.md` |
| Dynamic state | `./NOW.md` |
EOF
    fi
    
    echo -e "${GREEN}✓ Copied $CLAUDE_FILE${NC}"
fi

# Copy NOW.md
TARGET_NOW="$TARGET/NOW.md"
if [ -f "$TARGET_NOW" ]; then
    echo -e "${YELLOW}! NOW.md already exists at $TARGET_NOW${NC}"
    echo "  To append, run: cat $TMP_DIR/NOW.md >> $TARGET_NOW"
else
    cp "$TMP_DIR/NOW.md" "$TARGET_NOW"
    echo -e "${GREEN}✓ Copied NOW.md${NC}"
fi

# Cleanup temp files
rm -rf "$TMP_DIR"

echo ""
echo -e "${GREEN}Done!${NC}"
echo ""

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Your symbiotic agent is ready."
echo ""
echo "Two files power the system:"
echo "  $CLAUDE_FILE  — Your identity, psychology, patterns"
echo "  NOW.md        — Current state, projects, memory log"
echo ""
echo "The agent reads both at session start."
echo "Just start talking. It already knows you."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if [ "$TARGET_NAME" = "Claude Code" ]; then
    echo "Run: claude"
elif [ "$TARGET_NAME" = "OpenCode" ]; then
    echo "Run: opencode"
else
    echo "Open this directory with Claude Code or OpenCode."
fi

echo ""
echo "Go ship."
echo ""
