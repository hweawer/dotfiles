# dotfiles

Personal macOS dotfiles. The real config files live in this repo and are symlinked into
`$HOME` by `install.sh`. The repo is assumed to be cloned to `~/dotfiles` — paths in
`install.sh` hardcode that location.

## Layout

- `install.sh` — symlinks configs into place (`ln -sf "$PWD/<dir>/<file>" <target>`).
- `bootstrap.sh` — runs `brew bundle` then `install.sh`.
- One directory per tool: `tmux/`, `wezterm/`, `starship/`, `scripts/`, `config/`, `claude/`.
- `Brewfile` — Homebrew packages.

## Conventions

- To add a config: put the real file in its tool dir, add an `ln -sf` line to `install.sh`,
  then document the mapping in `README.md`.
- **Never edit a config through its `$HOME` symlink — edit the real file here in the repo.**
  `~/AGENTS.md` and everything under `~/.claude/` are symlinks into `claude/`; writing
  through them is refused.
- Don't track machine-local state: `~/.claude/settings.local.json`, caches, history, sessions.

## claude/ (Claude Code config)

- `claude/AGENTS.md` → `~/AGENTS.md`, and `~/.claude/CLAUDE.md` → `~/AGENTS.md`. Claude Code
  reads `CLAUDE.md`, so that symlink is what makes the instructions load.
- `claude/rules/` → `~/.claude/rules/` — **auto-loaded on every session** (user scope). Keep
  it minimal; only put rules here that should apply everywhere.
- `claude/library/` → `~/.claude/library/` — opt-in snippets, loaded only when a repo imports
  them via `@~/.claude/library/<name>.md`.

## Git

Commit identity and signing for this repo are set via untracked repo-local config —
see `CLAUDE.local.md` (not committed).
