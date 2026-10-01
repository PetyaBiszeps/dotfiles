#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"

link_path() {
  src="$1"
  dest="$2"

  if [ ! -e "$src" ]; then
    echo "Skip: source does not exist: $src"
    return 0
  fi

  rm -rf "$dest"

  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"

  echo "Linked: $dest -> $src"
}

link_config() {
  name="$1"

  link_path \
    "$DOTFILES_DIR/home/.config/$name" \
    "$HOME/.config/$name"
}

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
