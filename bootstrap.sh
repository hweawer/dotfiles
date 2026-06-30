#!/usr/bin/env bash
set -e

if ! command -v brew >/dev/null; then
    echo "Install Homebrew first"
    exit 1
fi

brew bundle --file Brewfile

./install.sh