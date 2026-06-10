#!/bin/bash
# Power-Kit Session Loader
# Auto-loads your last session context when you open Claude Code

# Find current project (use working directory)
PROJECT_NAME=$(basename "$PWD")
PROJECT_SLUG=$(echo "$PWD" | sed 's|/|-|g' | sed 's|^-||')

# Look for project-specific session context
SESSION_FILE="$HOME/.claude/projects/-Users-solvix-Desktop-$PROJECT_NAME/memory/session_context_active.md"

# Fallback: general power-kit session
GENERAL_FILE="$HOME/.claude/memory/last_session.md"

if [ -f "$SESSION_FILE" ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📋 YOUR LAST SESSION — $PROJECT_NAME"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    cat "$SESSION_FILE"
    echo ""
elif [ -f "$GENERAL_FILE" ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📋 YOUR LAST SESSION (General)"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    cat "$GENERAL_FILE"
    echo ""
else
    echo "👋 Welcome to Power-Kit! No previous session found."
    echo "   Type your first question to get started."
fi

exit 0
