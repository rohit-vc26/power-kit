#!/bin/bash
# Power-Kit Version Checker
# Checks GitHub for new Power-Kit version once per day

VERSION_FILE="$HOME/.claude/power-kit/version"
LAST_CHECK_FILE="$HOME/.claude/power-kit/.last_check"
GITHUB_REPO="rohit-vc26/power-kit"
DAILY=86400  # seconds

# Read current version
if [ ! -f "$VERSION_FILE" ]; then
    exit 0
fi
CURRENT=$(cat "$VERSION_FILE")

# Check last check time
if [ -f "$LAST_CHECK_FILE" ]; then
    LAST=$(cat "$LAST_CHECK_FILE")
    NOW=$(date +%s)
    DIFF=$((NOW - LAST))
    if [ "$DIFF" -lt "$DAILY" ]; then
        # Checked recently, skip
        exit 0
    fi
fi

# Check GitHub for latest release (silent fail if offline)
LATEST=$(curl -s --max-time 3 "https://api.github.com/repos/$GITHUB_REPO/releases/latest" 2>/dev/null | grep -o '"tag_name": "[^"]*' | cut -d'"' -f4 | sed 's/^v//')

if [ -z "$LATEST" ]; then
    # Offline or rate-limited, skip silently
    exit 0
fi

# Save check time
mkdir -p "$(dirname "$LAST_CHECK_FILE")"
date +%s > "$LAST_CHECK_FILE"

# Compare versions
if [ "$LATEST" != "$CURRENT" ]; then
    echo ""
    echo "🎉 Power-Kit update available!"
    echo "   Current: v$CURRENT"
    echo "   Latest:  v$LATEST"
    echo ""
    echo "   To update: Run 'update.bat' (Windows) or 'update.sh' (Mac)"
    echo "   See changes: https://github.com/$GITHUB_REPO/releases/tag/v$LATEST"
    echo ""
fi

exit 0
