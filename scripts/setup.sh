#!/usr/bin/env sh

set -eu

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

detect_os() {
  case "$(uname -s)" in
    Darwin)
      echo "macos"
      ;;
    Linux)
      if [ -r /etc/os-release ]; then
        . /etc/os-release
        echo "${ID:-linux}"
      else
        echo "linux"
      fi
      ;;
    *)
      echo "unknown"
      ;;
  esac
}

install_macos() {
  if ! command_exists brew; then
    echo "Homebrew is not installed."
    echo "Install Homebrew first:"
    echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    exit 1
  fi

  brew install \
    zsh \
    git \
    neovim \
    eza \
    fzf \
    atuin \
    oh-my-posh \
    zsh-autocomplete \
    zsh-autosuggestions
}

bootstrap_yay() {
  if command_exists yay; then
    echo "yay is already installed."
    return 0
  fi

  if ! command_exists pacman; then
    echo "pacman is required to bootstrap yay on Arch Linux."
    exit 1
  fi

  sudo pacman -S --needed --noconfirm \
    base-devel \
    git

  dev_dir="$HOME/Documents/dev"
  yay_dir="$dev_dir/yay"

  mkdir -p "$dev_dir"

  if [ ! -d "$yay_dir/.git" ]; then
    git clone https://aur.archlinux.org/yay.git "$yay_dir"
  else
    git -C "$yay_dir" pull --ff-only
  fi

  cd "$yay_dir"
  makepkg -si --noconfirm
}

install_arch() {
  bootstrap_yay

  yay -S --needed \
    zsh \
    git \
    neovim \
    eza \
    fzf \
    atuin \
    oh-my-posh \
    zsh-autocomplete \
    zsh-autosuggestions \
    tree-sitter-cli \
    ripgrep \
    fd \
    unzip \
    gcc \
    make
}

install_fedora() {
  if ! command_exists dnf; then
    echo "dnf is required on Fedora."
    exit 1
  fi

  sudo dnf install -y \
    zsh \
    git \
    neovim \
    eza \
    fzf \
    atuin \
    oh-my-posh \
    zsh-autosuggestions \
    tree-sitter-cli \
    ripgrep \
    fd-find \
    unzip \
    gcc \
    gcc-c++ \
    make

  if ! command_exists fd && command_exists fdfind; then
    mkdir -p "$HOME/.local/bin"
    ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
  fi

  echo "Fedora setup finished."
  echo "Check manually if oh-my-posh and zsh-autocomplete are available on your Fedora setup."
}

OS="$(detect_os)"

case "$OS" in
  macos)
    install_macos
    ;;
  arch|endeavouros|manjaro)
    install_arch
    ;;
  fedora)
    install_fedora
    ;;
  *)
    echo "Unsupported OS: $OS"
    exit 1
    ;;
esac
