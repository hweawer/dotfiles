#!/usr/bin/env bash
set -e

mkdir -p ~/.config
mkdir -p ~/.config/tmux
mkdir -p ~/.config/wezterm
mkdir -p ~/.config/work

ln -sf "$PWD/tmux/tmux.conf" ~/.config/tmux/tmux.conf
ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf

ln -sf "$PWD/wezterm/wezterm.lua" ~/.config/wezterm/wezterm.lua

ln -sf "$PWD/starship/starship.toml" ~/.config/starship.toml

# Claude Code config. AGENTS.md is the shared instruction file; ~/.claude/CLAUDE.md
# points at it so Claude Code reads it. rules/ auto-loads globally (keep it minimal);
# library/ holds opt-in rule snippets imported per-repo. settings.local.json is
# intentionally NOT managed here — it stays machine-local.
mkdir -p ~/.claude
ln -sf  "$PWD/claude/AGENTS.md"      ~/AGENTS.md
ln -sf  ~/AGENTS.md                  ~/.claude/CLAUDE.md
ln -sf  "$PWD/claude/settings.json"  ~/.claude/settings.json
rm -rf  ~/.claude/rules ~/.claude/library
ln -sfn "$PWD/claude/rules"          ~/.claude/rules
ln -sfn "$PWD/claude/library"        ~/.claude/library

mkdir -p ~/dotfiles/scripts
ln -sf "$PWD/scripts/work" ~/dotfiles/scripts/work

if [ ! -f ~/.config/work/projects.conf ]; then
    cp config/work/projects.conf.example ~/.config/work/projects.conf
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

~/.tmux/plugins/tpm/bin/install_plugins || true

echo "Done!"