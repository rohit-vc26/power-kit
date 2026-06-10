#!/bin/bash
# Power-Kit Session Saver
# Auto-saves what you were working on when you close Claude Code

# Use general location (project-specific saving requires Claude session info)
SAVE_DIR="$HOME/.claude/memory"
mkdir -p "$SAVE_DIR"

SAVE_FILE="$SAVE_DIR/last_session.md"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Get current project if possible
PROJECT_NAME=$(basename "$PWD")

cat > "$SAVE_FILE" << EOF
---
saved_at: $TIMESTAMP
project: $PROJECT_NAME
---

# Last Session — $PROJECT_NAME

**Saved**: $TIMESTAMP
**Project**: $PROJECT_NAME ($PWD)

## What was happening
(Claude will fill this in based on the conversation)

## Pending work
(Anything not finished)

## Next steps
(What to do when you come back)

---

**To resume**: Open Claude Code in $PWD and your session will load.
EOF

exit 0
