#!/bin/bash
# Power-Kit Email Rule Checker
# Runs when Claude writes/edits files to flag email rule violations
# Advisory only — does not block, just warns

# This hook is triggered on Write|Edit
# It reads CLAUDE_TOOL_INPUT env var if set, otherwise no-op

if [ -z "$CLAUDE_TOOL_INPUT" ]; then
    exit 0
fi

# Quick checks (only fire warnings, never block):

# Check 1: Em-dash
if echo "$CLAUDE_TOOL_INPUT" | grep -q "—"; then
    echo "⚠️  Email rule warning: Em-dash (—) found. Use hyphen or comma instead."
fi

# Check 2: Banned words
BANNED="guaranteed|guarantee|risk-free|limited time|act now|don't miss out|claim your|exclusive offer"
if echo "$CLAUDE_TOOL_INPUT" | grep -iE "$BANNED" > /dev/null; then
    echo "⚠️  Email rule warning: Banned spam word detected. Check email rules."
fi

# Always allow (advisory only)
exit 0
