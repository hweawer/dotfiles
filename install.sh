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