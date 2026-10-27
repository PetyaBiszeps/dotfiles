#!/usr/bin/env sh

install_arch() {
  echo "==> Installing packages for Arch-based system"

  yay -S --needed --noconfirm --answerclean None --answerdiff None \
    git github-cli git-delta \
    mise oh-my-posh pass tmux \
    zsh-autocomplete zsh-autosuggestions \
    atuin bat eza fd fzf ripgrep zoxide jq direnv
}
