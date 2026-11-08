#!/usr/bin/env sh

install_macos() {
  echo "==> Installing packages for macOS"

  brew install \
    git gh git-delta lazygit \
    mise oh-my-posh pass \
    zsh-autocomplete zsh-autosuggestions \
    atuin bat eza fd fzf ripgrep zoxide jq direnv libiconv \
    lazydocker k9s

  brew install --cask \
    iterm2 herdr-app \
    helium-browser firefox \
    docker-desktop \
    font-jetbrains-mono-nerd-font
}
