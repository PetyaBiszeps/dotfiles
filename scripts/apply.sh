#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"

. "$DOTFILES_DIR/scripts/utils/link.sh"

# Home
link_path "$DOTFILES_DIR/home/.zshrc" "$HOME/.zshrc"

# Config
link_config "zsh"
link_config "oh-my-posh"
link_config "atuin"
link_config "bat"
link_config "git"
link_config "tmux"
link_config "mise"
