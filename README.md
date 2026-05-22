# my_claude_settings

Synced Claude Code settings for `~/.claude`. The repo lives directly at `~/.claude`; only a whitelist of config files is tracked (see `.gitignore`).

## Tracked files

- `CLAUDE.md` — global instructions
- `settings.json` — harness settings, hooks, model
- `plugins/installed_plugins.json`, `plugins/known_marketplaces.json` — plugin config
- `hooks/sync-pull.sh`, `hooks/sync-push.sh` — sync hooks (and any custom hooks added later)

Everything else (credentials, history, sessions, projects, caches, plans) stays local.

## Sync behavior

- **SessionStart** runs `hooks/sync-pull.sh` → `git pull --rebase --autostash`. Picks up remote changes; they apply on the *next* session since `settings.json` is already loaded.
- **Stop** runs `hooks/sync-push.sh` → auto-commits and pushes any changes to tracked files.

Logs go to `hooks/sync.log` (gitignored).

## Bootstrap on a new machine

```bash
# Back up any existing ~/.claude content you want to keep
mv ~/.claude ~/.claude.backup 2>/dev/null

git clone git@github.com:ktmdan/my_claude_settings.git ~/.claude
chmod +x ~/.claude/hooks/sync-pull.sh ~/.claude/hooks/sync-push.sh

# Restore per-machine state (credentials, sessions, etc.) from the backup if needed
```
