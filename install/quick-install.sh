#!/bin/bash
# Power-Kit One-Line Installer (Mac/Linux)
# Usage: curl -fsSL https://raw.githubusercontent.com/rohit-vc26/power-kit/main/install/quick-install.sh | bash

set -e

GITHUB_REPO="rohit-vc26/power-kit"
TMP_DIR="$(mktemp -d)"

echo ""
echo "🚀 Installing Power-Kit..."
echo ""

# Check Claude Code
if ! command -v claude &> /dev/null; then
    echo "❌ Claude Code not found. Install it first: https://claude.com/code"
    exit 1
fi

# Get latest version from GitHub
LATEST=$(curl -sL "https://api.github.com/repos/$GITHUB_REPO/releases/latest" | grep -o '"tag_name": "[^"]*' | cut -d'"' -f4)

if [ -z "$LATEST" ]; then
    echo "❌ Could not connect to GitHub. Check your internet."
    exit 1
fi

echo "📦 Downloading Power-Kit $LATEST..."

# Download tarball
cd "$TMP_DIR"
curl -sL "https://github.com/$GITHUB_REPO/archive/refs/tags/$LATEST.tar.gz" -o power-kit.tar.gz
tar xzf power-kit.tar.gz

# Find extracted directory
EXTRACTED_DIR=$(find . -maxdepth 1 -type d -name "power-kit-*" | head -1)
cd "$EXTRACTED_DIR"

echo "⚙️  Running setup..."
bash install/install.sh

# Cleanup
rm -rf "$TMP_DIR"

echo ""
echo "✅ Power-Kit installed!"
echo ""
echo "Open Claude Code and start working."
echo "First-time guide: https://github.com/$GITHUB_REPO/blob/main/docs/beginner-guide.md"
echo ""
