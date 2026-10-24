#!/usr/bin/env sh

install_macos() {
  echo "==> Installing packages for macOS"

  brew install \
    git gh git-delta \
    mise oh-my-posh pass tmux \
    zsh-autocomplete zsh-autosuggestions \
    atuin bat eza fd fzf ripgrep zoxide jq direnv libiconv

  brew install --cask \
    iterm2 helium-browser firefox \
    font-jetbrains-mono-nerd-font
}
