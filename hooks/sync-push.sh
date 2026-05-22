#!/bin/bash
# Stop: commit and push any changes to tracked settings files.
cd "$HOME/.claude" 2>/dev/null || exit 0

if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  exit 0
fi

git add -A
git commit -m "auto: $(date -u +%Y-%m-%dT%H:%M:%SZ) from $(hostname -s)" --quiet || exit 0
git push --quiet 2>>"$HOME/.claude/hooks/sync.log" || true
exit 0
