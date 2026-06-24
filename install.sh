#!/bin/bash

# Symbiotic AI - One-liner installer
# Usage: curl -fsSL https://raw.githubusercontent.com/lout33/symbiotic-ai/main/install.sh | bash

set -e

REPO_URL="https://raw.githubusercontent.com/lout33/symbiotic-ai/main"
TMP_DIR="/tmp/symbiotic_ai_install"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "Downloading Symbiotic AI..."
echo ""

# Create temp directory
mkdir -p "$TMP_DIR"

# Download the 4 core files
curl -fsSL "$REPO_URL/AGENTS.md" -o "$TMP_DIR/AGENTS.md" || { echo "Failed to download AGENTS.md"; exit 1; }
curl -fsSL "$REPO_URL/SOUL.md" -o "$TMP_DIR/SOUL.md" || { echo "Failed to download SOUL.md"; exit 1; }
curl -fsSL "$REPO_URL/USER.md" -o "$TMP_DIR/USER.md" || { echo "Failed to download USER.md"; exit 1; }
curl -fsSL "$REPO_URL/NOW.md" -o "$TMP_DIR/NOW.md" || { echo "Failed to download NOW.md"; exit 1; }

# Download tier-1 optional files
curl -fsSL "$REPO_URL/COMMITMENTS.md" -o "$TMP_DIR/COMMITMENTS.md" || { echo "Failed to download COMMITMENTS.md"; exit 1; }

# Download optional files
curl -fsSL "$REPO_URL/HEARTBEAT.md" -o "$TMP_DIR/HEARTBEAT.md" || { echo "Failed to download HEARTBEAT.md"; exit 1; }

# Download commands
mkdir -p "$TMP_DIR/commands"
curl -fsSL "$REPO_URL/commands/start-day.md" -o "$TMP_DIR/commands/start-day.md" || { echo "Failed to download start-day.md"; exit 1; }
curl -fsSL "$REPO_URL/commands/check-day.md" -o "$TMP_DIR/commands/check-day.md" || { echo "Failed to download check-day.md"; exit 1; }
curl -fsSL "$REPO_URL/commands/end-day.md" -o "$TMP_DIR/commands/end-day.md" || { echo "Failed to download end-day.md"; exit 1; }
curl -fsSL "$REPO_URL/commands/reflect.md" -o "$TMP_DIR/commands/reflect.md" || { echo "Failed to download reflect.md"; exit 1; }

# Download guides
mkdir -p "$TMP_DIR/guides"
curl -fsSL "$REPO_URL/guides/heartbeat-setup.md" -o "$TMP_DIR/guides/heartbeat-setup.md" || { echo "Failed to download heartbeat-setup.md"; exit 1; }

# Detect installed tools
CLAUDE_CODE=false
OPENCODE=false
NANOBOT=false
HERMES=false

if [ -d "$HOME/.claude" ]; then
    CLAUDE_CODE=true
fi

if [ -d "$HOME/.config/opencode" ]; then
    OPENCODE=true
fi

if [ -d "$HOME/.nanobot" ]; then
    NANOBOT=true
fi

if command -v hermes >/dev/null 2>&1 || [ -d "$HOME/.hermes" ]; then
    HERMES=true
fi

# Determine install target
TARGET=""
TARGET_NAME=""
IS_CLAUDE_CODE=false
INSTALL_HERMES_SOUL=false

set_target_from_choice() {
    case "$1" in
        claude-global)
            TARGET="$HOME/.claude"
            TARGET_NAME="Claude Code (Global)"
            IS_CLAUDE_CODE=true
            ;;
        claude-local)
            TARGET="."
            TARGET_NAME="Claude Code (Local)"
            IS_CLAUDE_CODE=true
            ;;
        opencode-global)
            TARGET="$HOME/.config/opencode"
            TARGET_NAME="opencode (Global)"
            ;;
        opencode-local)
            TARGET="."
            TARGET_NAME="opencode (Local)"
            ;;
        hermes-workspace)
            TARGET="."
            TARGET_NAME="Hermes (Workspace)"
            INSTALL_HERMES_SOUL=true
            ;;
        hermes-workspace-only)
            TARGET="."
            TARGET_NAME="Hermes (Workspace only)"
            ;;
        *)
            echo "Invalid choice. Exiting."
            rm -rf "$TMP_DIR"
            exit 1
            ;;
    esac
}

if [ "$HERMES" = true ] && [ "$CLAUDE_CODE" = true ] && [ "$OPENCODE" = true ]; then
    echo "Detected Hermes, Claude Code, and opencode."
    echo ""
    echo "Where do you want to install?"
    echo "  1) Hermes - Workspace here + global SOUL (~/.hermes/SOUL.md)"
    echo "  2) Hermes - Workspace here only"
    echo "  3) Claude Code - Global (~/.claude/)"
    echo "  4) Claude Code - Local (./)"
    echo "  5) opencode - Global (~/.config/opencode/)"
    echo "  6) opencode - Local (./)"
    echo ""

    if [ -e /dev/tty ]; then
        read -p "Choose [1/2/3/4/5/6]: " choice < /dev/tty
    else
        echo "Non-interactive mode. Exiting."
        rm -rf "$TMP_DIR"
        exit 1
    fi

    case $choice in
        1) set_target_from_choice hermes-workspace ;;
        2) set_target_from_choice hermes-workspace-only ;;
        3) set_target_from_choice claude-global ;;
        4) set_target_from_choice claude-local ;;
        5) set_target_from_choice opencode-global ;;
        6) set_target_from_choice opencode-local ;;
        *) set_target_from_choice invalid ;;
    esac
elif [ "$HERMES" = true ] && [ "$CLAUDE_CODE" = true ]; then
    echo "Detected Hermes and Claude Code."
    echo ""
    echo "Where do you want to install?"
    echo "  1) Hermes - Workspace here + global SOUL (~/.hermes/SOUL.md)"
    echo "  2) Hermes - Workspace here only"
    echo "  3) Claude Code - Global (~/.claude/)"
    echo "  4) Claude Code - Local (./)"
    echo ""

    if [ -e /dev/tty ]; then
        read -p "Choose [1/2/3/4]: " choice < /dev/tty
    else
        echo "Non-interactive mode. Exiting."
        rm -rf "$TMP_DIR"
        exit 1
    fi

    case $choice in
        1) set_target_from_choice hermes-workspace ;;
        2) set_target_from_choice hermes-workspace-only ;;
        3) set_target_from_choice claude-global ;;
        4) set_target_from_choice claude-local ;;
        *) set_target_from_choice invalid ;;
    esac
elif [ "$HERMES" = true ] && [ "$OPENCODE" = true ]; then
    echo "Detected Hermes and opencode."
    echo ""
    echo "Where do you want to install?"
    echo "  1) Hermes - Workspace here + global SOUL (~/.hermes/SOUL.md)"
    echo "  2) Hermes - Workspace here only"
    echo "  3) opencode - Global (~/.config/opencode/)"
    echo "  4) opencode - Local (./)"
    echo ""

    if [ -e /dev/tty ]; then
        read -p "Choose [1/2/3/4]: " choice < /dev/tty
    else
        echo "Non-interactive mode. Exiting."
        rm -rf "$TMP_DIR"
        exit 1
    fi

    case $choice in
        1) set_target_from_choice hermes-workspace ;;
        2) set_target_from_choice hermes-workspace-only ;;
        3) set_target_from_choice opencode-global ;;
        4) set_target_from_choice opencode-local ;;
        *) set_target_from_choice invalid ;;
    esac
elif [ "$CLAUDE_CODE" = true ] && [ "$OPENCODE" = true ]; then
    echo "Detected both Claude Code and opencode."
    echo ""
    echo "Where do you want to install?"
    echo "  1) Claude Code - Global (~/.claude/)"
    echo "  2) Claude Code - Local (./)"
    echo "  3) opencode - Global (~/.config/opencode/)"
    echo "  4) opencode - Local (./)"
    echo ""

    if [ -e /dev/tty ]; then
        read -p "Choose [1/2/3/4]: " choice < /dev/tty
    else
        echo "Non-interactive mode. Exiting."
        rm -rf "$TMP_DIR"
        exit 1
    fi

    case $choice in
        1) set_target_from_choice claude-global ;;
        2) set_target_from_choice claude-local ;;
        3) set_target_from_choice opencode-global ;;
        4) set_target_from_choice opencode-local ;;
        *) set_target_from_choice invalid ;;
    esac
elif [ "$HERMES" = true ]; then
    echo "Detected: Hermes Agent"
    echo ""
    echo "Where do you want to install?"
    echo "  1) Hermes - Workspace here + global SOUL (~/.hermes/SOUL.md)"
    echo "  2) Hermes - Workspace here only"
    echo ""

    if [ -e /dev/tty ]; then
        read -p "Choose [1/2]: " choice < /dev/tty
    else
        echo "Non-interactive mode. Exiting."
        rm -rf "$TMP_DIR"
        exit 1
    fi

    case $choice in
        1) set_target_from_choice hermes-workspace ;;
        2) set_target_from_choice hermes-workspace-only ;;
        *) set_target_from_choice invalid ;;
    esac
elif [ "$CLAUDE_CODE" = true ]; then
    echo "Detected: Claude Code"
    echo ""
    echo "Where do you want to install?"
    echo "  1) Global (~/.claude/)"
    echo "  2) Local (./)"
    echo ""

    if [ -e /dev/tty ]; then
        read -p "Choose [1/2]: " choice < /dev/tty
    else
        echo "Non-interactive mode. Exiting."
        rm -rf "$TMP_DIR"
        exit 1
    fi

    case $choice in
        1) set_target_from_choice claude-global ;;
        2) set_target_from_choice claude-local ;;
        *) set_target_from_choice invalid ;;
    esac
elif [ "$OPENCODE" = true ]; then
    echo "Detected: opencode"
    echo ""
    echo "Where do you want to install?"
    echo "  1) Global (~/.config/opencode/)"
    echo "  2) Local (./)"
    echo ""

    if [ -e /dev/tty ]; then
        read -p "Choose [1/2]: " choice < /dev/tty
    else
        echo "Non-interactive mode. Exiting."
        rm -rf "$TMP_DIR"
        exit 1
    fi

    case $choice in
        1) set_target_from_choice opencode-global ;;
        2) set_target_from_choice opencode-local ;;
        *) set_target_from_choice invalid ;;
    esac
else
    echo "No Hermes, Claude Code, or opencode installation detected."
    echo ""
    echo "Installing to current directory..."
    TARGET="."
    TARGET_NAME="Local"
fi

echo ""
echo "Installing to $TARGET_NAME..."
echo ""

# Function to copy file with backup
copy_with_backup() {
    local src="$1"
    local dest="$2"
    local filename=$(basename "$dest")
    
    if [ -f "$dest" ]; then
        echo -e "${YELLOW}! $filename already exists${NC}"
        echo "  Backup created at $dest.backup"
        cp "$dest" "$dest.backup"
    fi
    cp "$src" "$dest"
    echo -e "${GREEN}+ Copied $filename${NC}"
}

# Copy the 4 core files
copy_with_backup "$TMP_DIR/AGENTS.md" "$TARGET/AGENTS.md"
copy_with_backup "$TMP_DIR/SOUL.md" "$TARGET/SOUL.md"
copy_with_backup "$TMP_DIR/USER.md" "$TARGET/USER.md"
copy_with_backup "$TMP_DIR/NOW.md" "$TARGET/NOW.md"

# Copy HEARTBEAT.md
copy_with_backup "$TMP_DIR/HEARTBEAT.md" "$TARGET/HEARTBEAT.md"

# Copy COMMITMENTS.md
copy_with_backup "$TMP_DIR/COMMITMENTS.md" "$TARGET/COMMITMENTS.md"

# Optional global SOUL for Hermes
if [ "$INSTALL_HERMES_SOUL" = true ]; then
    mkdir -p "$HOME/.hermes"
    copy_with_backup "$TMP_DIR/SOUL.md" "$HOME/.hermes/SOUL.md"
fi

# For Claude Code, also create combined CLAUDE.md
if [ "$IS_CLAUDE_CODE" = true ]; then
    echo ""
    echo "Creating CLAUDE.md for Claude Code compatibility..."
    cat "$TMP_DIR/AGENTS.md" "$TMP_DIR/SOUL.md" "$TMP_DIR/USER.md" "$TMP_DIR/NOW.md" > "$TARGET/CLAUDE.md"
    echo -e "${GREEN}+ Created CLAUDE.md (combined file)${NC}"
fi

# Copy commands to appropriate location
if [ "$TARGET" = "." ]; then
    if [[ "$TARGET_NAME" == *"Hermes"* ]]; then
        COMMANDS_DIR="commands"
    elif [ "$IS_CLAUDE_CODE" = true ]; then
        COMMANDS_DIR=".claude/commands"
    else
        COMMANDS_DIR=".opencode/commands"
    fi
else
    COMMANDS_DIR="$TARGET/commands"
fi

mkdir -p "$COMMANDS_DIR"
cp "$TMP_DIR/commands/"*.md "$COMMANDS_DIR/"
echo -e "${GREEN}+ Copied commands (start-day, check-day, end-day, reflect)${NC}"

# Copy guides
GUIDES_DIR="$TARGET/guides"
mkdir -p "$GUIDES_DIR"
cp "$TMP_DIR/guides/"*.md "$GUIDES_DIR/"
echo -e "${GREEN}+ Copied guides (heartbeat-setup)${NC}"

# nanobot hint
if [ "$NANOBOT" = true ]; then
    echo ""
    echo -e "${YELLOW}nanobot detected!${NC}"
    echo "To use with nanobot, edit ~/.nanobot/config.json:"
    echo "  \"workspace\": \"$(cd "$TARGET" && pwd)\""
fi

# Cleanup temp files
rm -rf "$TMP_DIR"

echo ""
echo -e "${GREEN}Done!${NC}"
echo ""
echo "============================================================"
echo ""
echo "Your Symbiotic system is ready."
echo ""
echo "Core files:"
echo "  AGENTS.md     - Operations, rules, how the agent works"
echo "  SOUL.md       - Agent personality and identity"
echo "  USER.md       - Your profile, psychology, patterns"
echo "  NOW.md        - Current state, projects, memory log"
echo ""
echo "Tier-1 optional file:"
echo "  COMMITMENTS.md - Said vs Did tracking, repeated promises, follow-through"
echo ""
echo "HEARTBEAT (screen-aware accountability):"
echo "  HEARTBEAT.md  - Watches your screen, pings you on Telegram"
echo "  Setup guide:  guides/heartbeat-setup.md"
echo "  Requires:     OpenClaw + Telegram + what-did-i-do"
echo ""
echo "Commands:"
echo "  /start-day    - Morning kickoff, set MIT"
echo "  /check-day    - Quick accountability check-in"
echo "  /end-day      - Evening review, capture wins"
echo "  /reflect      - Deep reflection, creates journal entry"
echo ""
echo "Start one conversation, get a clear next step, and keep going from these files."
echo "The agent reads them at session start so the next session begins with context."
if [ "$INSTALL_HERMES_SOUL" = true ]; then
    echo ""
    echo "Hermes global voice:"
    echo "  ~/.hermes/SOUL.md - Stable voice/personality for Hermes"
fi
echo ""
echo "============================================================"
echo ""

if [[ "$TARGET_NAME" == *"Hermes"* ]]; then
    echo "Run: hermes"
elif [[ "$TARGET_NAME" == *"Claude Code"* ]]; then
    echo "Run: claude"
elif [[ "$TARGET_NAME" == *"opencode"* ]]; then
    echo "Run: opencode"
else
    echo "Open this directory with your AI coding tool."
fi

echo ""
echo "Go ship."
echo ""
