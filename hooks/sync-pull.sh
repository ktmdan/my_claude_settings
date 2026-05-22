#!/bin/bash
# SessionStart: pull latest settings from origin. Never blocks startup.
cd "$HOME/.claude" 2>/dev/null || exit 0
git pull --rebase --autostash --quiet 2>>"$HOME/.claude/hooks/sync.log" || true
exit 0
