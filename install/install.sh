#!/bin/bash
# Power-Kit Mac/Linux Installer
# No questions asked. Just installs.
# Version: 1.0.0

set -e

echo ""
echo "============================================"
echo "  POWER-KIT INSTALLER v1.0.0"
echo "============================================"
echo ""
echo "Setting up your Claude Code toolkit..."
echo ""

# Step 1: Check Claude Code installed
if ! command -v claude &> /dev/null; then
    echo "[!] Claude Code not found."
    echo ""
    echo "Please install Claude Code first:"
    echo "https://claude.com/code"
    echo ""
    exit 1
fi
echo "[OK] Claude Code found."

# Step 2: Find Claude config directory
CLAUDE_DIR="$HOME/.claude"
if [ ! -d "$CLAUDE_DIR" ]; then
    echo "[OK] Creating Claude config directory..."
    mkdir -p "$CLAUDE_DIR"
fi
echo "[OK] Claude directory: $CLAUDE_DIR"

# Step 3: Backup existing settings
if [ -f "$CLAUDE_DIR/settings.json" ]; then
    BACKUP_NAME="settings.json.bak-powerkit-$(date +%s)"
    echo "[OK] Backing up existing settings to $BACKUP_NAME..."
    cp "$CLAUDE_DIR/settings.json" "$CLAUDE_DIR/$BACKUP_NAME"
fi

# Step 4: Get installer's location (Power-Kit folder)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
POWERKIT_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"
echo "[OK] Power-Kit source: $POWERKIT_DIR"

# Step 5: Create destination folders
mkdir -p "$CLAUDE_DIR/hooks"
mkdir -p "$CLAUDE_DIR/skills"
mkdir -p "$CLAUDE_DIR/memory"
mkdir -p "$CLAUDE_DIR/projects"
mkdir -p "$CLAUDE_DIR/power-kit"
echo "[OK] Folders ready."

# Step 6: Copy hooks
echo "[OK] Installing hooks..."
cp -f "$POWERKIT_DIR/hooks/"*.sh "$CLAUDE_DIR/hooks/" 2>/dev/null || true
chmod +x "$CLAUDE_DIR/hooks/"*.sh 2>/dev/null || true

# Step 7: Copy memory templates
echo "[OK] Installing memory templates..."
cp -f "$POWERKIT_DIR/memory/"*.md "$CLAUDE_DIR/memory/" 2>/dev/null || true

# Step 8: Copy skills config
echo "[OK] Installing skills config..."
cp -rf "$POWERKIT_DIR/skills/." "$CLAUDE_DIR/skills/" 2>/dev/null || true

# Step 9: Install settings.json
echo "[OK] Configuring Claude Code settings..."
cp "$POWERKIT_DIR/config/settings.json" "$CLAUDE_DIR/settings.json"

# Step 10: Copy version info
echo "[OK] Installing version info..."
cp "$POWERKIT_DIR/config/.power-kit-version" "$CLAUDE_DIR/power-kit/version"
cp "$POWERKIT_DIR/CHANGELOG.md" "$CLAUDE_DIR/power-kit/CHANGELOG.md"

# Step 11: Note claude-mem plugin status
echo "[OK] Checking claude-mem plugin..."
if [ ! -d "$CLAUDE_DIR/plugins/cache/thedotmack/claude-mem" ]; then
    echo "    Will install claude-mem on first Claude Code launch"
fi

echo ""
echo "============================================"
echo "  INSTALLATION COMPLETE!"
echo "============================================"
echo ""
echo "What's installed:"
echo "  - Excel + Google Sheets skills"
echo "  - Email writing helpers"
echo "  - Auto-save sessions"
echo "  - Smart model switcher"
echo "  - Email rule checker"
echo ""
echo "NEXT STEPS:"
echo "  1. Open Claude Code"
echo "  2. Type 'hello' to test"
echo "  3. Read: $POWERKIT_DIR/docs/beginner-guide.md"
echo ""
echo "Power-Kit version: 1.0.0"
echo "Installed to: $CLAUDE_DIR"
echo ""
