#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

link_path() {
  src="$1"
  dest="$2"

  if [ ! -e "$src" ]; then
    echo "Skip: source does not exist: $src"
    return 0
  fi

  if [ -L "$dest" ] || [ -e "$dest" ]; then
    rm -rf "$dest"
  fi

  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"

  echo "Linked: $dest -> $src"
}

# Zsh
link_path "$DOTFILES_DIR/home/.zshrc" "$HOME/.zshrc"

# Oh My Posh
link_path "$DOTFILES_DIR/home/.config/oh-my-posh" "$HOME/.config/oh-my-posh"

# Neovim
link_path "$DOTFILES_DIR/home/.config/nvim" "$HOME/.config/nvim"
