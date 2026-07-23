# dotfiles

## 1. Install Homebrew packages

Clone this repo to `~/dotfiles` (paths in `install.sh` assume this location), then:

```sh
brew bundle --file Brewfile
```

This installs tmux, neovim, starship, zoxide, and other CLI tools, plus WezTerm and the
Hack Nerd Font cask. `bootstrap.sh` runs this step followed by `install.sh` in one go.

## 2. Run install.sh

```sh
./install.sh
```

This symlinks the tracked configs into place:

- `tmux/tmux.conf` → `~/.config/tmux/tmux.conf` (and `~/.tmux.conf`)
- `wezterm/wezterm.lua` → `~/.config/wezterm/wezterm.lua`
- `starship/starship.toml` → `~/.config/starship.toml`
- `claude/AGENTS.md` → `~/AGENTS.md` (and `~/.claude/CLAUDE.md` → `~/AGENTS.md`)
- `claude/RTK.md` → `~/.claude/RTK.md`, `claude/settings.json` → `~/.claude/settings.json`
- `claude/rules` → `~/.claude/rules` (auto-loaded globally) and `claude/library` →
  `~/.claude/library` (opt-in rule snippets, imported per-repo). `settings.local.json`
  is machine-local and intentionally not tracked.
- `scripts/work` → `~/dotfiles/scripts/work`
- copies `config/work/projects.conf.example` → `~/.config/work/projects.conf` (first run only)
- clones and installs the tmux plugin manager (tpm)

## 3. Manual steps

`install.sh` does not touch your shell rc file. Add the following to `~/.zshrc`:

```sh
eval "$(starship init zsh)"
export PATH="$HOME/dotfiles/scripts:$PATH"
```

The `PATH` export is what makes the scripts in `scripts/` (e.g. `work`, `lido`) runnable
by name from anywhere.

Then fill in your projects in `~/.config/work/projects.conf` (format documented in the
`.example` file) so the `work` script has something to switch to.
