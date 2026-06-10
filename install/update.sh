#!/bin/bash
# Power-Kit Updater (Mac/Linux)
# Pulls latest version from GitHub and reinstalls

set -e

echo ""
echo "============================================"
echo "  POWER-KIT UPDATER"
echo "============================================"
echo ""

GITHUB_REPO="rohit-vc26/power-kit"
TMP_DIR="/tmp/power-kit-update-$$"
CURRENT_VERSION=$(cat "$HOME/.claude/power-kit/version" 2>/dev/null || echo "unknown")

echo "Current version: v$CURRENT_VERSION"
echo "Checking for updates..."

# Get latest tag
LATEST=$(curl -s "https://api.github.com/repos/$GITHUB_REPO/releases/latest" | grep -o '"tag_name": "[^"]*' | cut -d'"' -f4 | sed 's/^v//')

if [ -z "$LATEST" ]; then
    echo "[!] Could not check GitHub. Try again later."
    exit 1
fi

echo "Latest version: v$LATEST"

if [ "$LATEST" = "$CURRENT_VERSION" ]; then
    echo "[OK] Already on latest version."
    exit 0
fi

echo ""
echo "Downloading v$LATEST..."

mkdir -p "$TMP_DIR"
cd "$TMP_DIR"
curl -sL "https://github.com/$GITHUB_REPO/archive/refs/tags/v$LATEST.tar.gz" -o power-kit.tar.gz
tar xzf power-kit.tar.gz
cd "power-kit-$LATEST"

echo "Running installer..."
bash install/install.sh

# Cleanup
rm -rf "$TMP_DIR"

echo ""
echo "[OK] Updated to v$LATEST"
echo ""
