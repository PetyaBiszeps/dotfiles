#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"

. "$DOTFILES_DIR/scripts/utils/platform.sh"
. "$DOTFILES_DIR/scripts/utils/link.sh"

# Home
link_path "$DOTFILES_DIR/home/.zshrc" "$HOME/.zshrc"

# Config
link_config "zsh"
link_config "oh-my-posh"
link_config "atuin"
link_config "bat"
link_config "git"
link_config "mise"

# Platform config
link_profile_config "herdr-app/keys.json"

# Zsh default shell
if [ "$SHELL" != "$ZSH_PATH" ]; then
  echo "==> Setting Zsh as default shell"
  chsh -s "$ZSH_PATH"
fi
