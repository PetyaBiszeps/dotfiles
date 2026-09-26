#!/usr/bin/env sh

set -eu

install_macos() {
  echo "==> Installing packages for macOS"

  brew install \
    git gh pi-coding-agent \
    mise oh-my-posh tmux neovim tree-sitter-cli \
    zsh-autocomplete zsh-autosuggestions \
    atuin bat eza fd fzf ripgrep zoxide jq direnv
}

install_omarchy() {
  echo "==> Installing packages for Omarchy"

  omarchy pkg add \
    git github-cli \
    mise tmux neovim tree-sitter-cli \
    zsh-autocomplete zsh-autosuggestions \
    atuin bat eza fd fzf ripgrep zoxide jq direnv

  omarchy pkg aur add \
    oh-my-posh \
    pi-coding-agent-bin
}

case "$(uname -s)" in
  Darwin)
    install_macos
    ;;

  Linux)
    if command -v omarchy >/dev/null 2>&1; then
      install_omarchy
    else
      echo "Unsupported Linux distribution"
      exit 1
    fi
    ;;

  *)
    echo "Unsupported operating system: $(uname -s)"
    exit 1
    ;;
esac

echo "==> Done"
