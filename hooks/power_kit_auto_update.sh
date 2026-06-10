#!/bin/bash
# Power-Kit FULL AUTO-UPDATE
# Silently pulls + applies updates in background. No user action needed.

VERSION_FILE="$HOME/.claude/power-kit/version"
LAST_CHECK_FILE="$HOME/.claude/power-kit/.last_check"
LOG_FILE="$HOME/.claude/power-kit/auto-update.log"
GITHUB_REPO="rohit-vc26/power-kit"
CHECK_INTERVAL=21600  # 6 hours

mkdir -p "$(dirname "$LOG_FILE")"

# Don't check too often
if [ -f "$LAST_CHECK_FILE" ]; then
    LAST=$(cat "$LAST_CHECK_FILE" 2>/dev/null || echo "0")
    NOW=$(date +%s)
    DIFF=$((NOW - LAST))
    if [ "$DIFF" -lt "$CHECK_INTERVAL" ]; then
        exit 0
    fi
fi

# Read current version
if [ ! -f "$VERSION_FILE" ]; then
    exit 0
fi
CURRENT=$(cat "$VERSION_FILE" | tr -d '[:space:]')

# Check GitHub silently (3 sec timeout, fail silently)
LATEST=$(curl -sL --max-time 3 "https://api.github.com/repos/$GITHUB_REPO/releases/latest" 2>/dev/null | grep -o '"tag_name": "[^"]*' | cut -d'"' -f4 | sed 's/^v//')

if [ -z "$LATEST" ]; then
    # Offline or rate-limited
    exit 0
fi

# Save check time
date +%s > "$LAST_CHECK_FILE"

# Same version → no action
if [ "$LATEST" = "$CURRENT" ]; then
    exit 0
fi

# New version available — auto-apply
echo ""
echo "🎉 Power-Kit auto-updating: v$CURRENT → v$LATEST"
echo "   (Updates apply silently in background — your work is safe)"
echo ""

{
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Auto-update started: $CURRENT → $LATEST"

    # Download latest
    TMP_DIR="$(mktemp -d)"
    cd "$TMP_DIR"

    if curl -sL --max-time 30 "https://github.com/$GITHUB_REPO/archive/refs/tags/v$LATEST.tar.gz" -o power-kit.tar.gz; then
        tar xzf power-kit.tar.gz 2>/dev/null
        EXTRACTED=$(find . -maxdepth 1 -type d -name "power-kit-*" | head -1)

        if [ -n "$EXTRACTED" ]; then
            cd "$EXTRACTED"
            bash install/install.sh > /dev/null 2>&1
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] Auto-update SUCCESS: now on v$LATEST"
            echo "✅ Updated to v$LATEST"
        else
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] Auto-update FAILED: extraction error"
        fi
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Auto-update FAILED: download error"
    fi

    # Cleanup
    rm -rf "$TMP_DIR"
} >> "$LOG_FILE" 2>&1

exit 0
