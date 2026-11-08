#!/usr/bin/env sh

install_arch() {
  echo "==> Installing packages for Arch-based system"

  yay -S --needed --noconfirm --answerclean None --answerdiff None \
    git github-cli git-delta lazygit \
    mise oh-my-posh pass herdr-app-desktop-bin \
    zsh-autocomplete zsh-autosuggestions \
    atuin bat eza fd fzf ripgrep zoxide jq direnv

  yay -S --needed --noconfirm --answerclean None --answerdiff None \
    autoconf bison re2c libxml2 oniguruma \
    gd sqlite postgresql-libs libzip unzip

  yay -S --needed --noconfirm --answerclean None --answerdiff None \
    docker docker-compose docker-buildx kubectl lazydocker k9s
}
