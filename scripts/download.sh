#!/usr/bin/env sh

set -eu

install_macos() {
  echo "==> Installing packages for macOS"

  brew install \
    git gh git-delta \
    mise oh-my-posh tmux \
    zsh-autocomplete zsh-autosuggestions \
    atuin bat eza fd fzf ripgrep zoxide jq direnv libiconv
}

case "$(uname -s)" in
  Darwin)
    install_macos
    ;;

  Linux)
    echo "Linux is not supported yet"
    exit 1
    ;;

  *)
    echo "Unsupported operating system: $(uname -s)"
    exit 1
    ;;
esac

echo "==> Done"
