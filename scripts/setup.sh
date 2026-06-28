#!/usr/bin/env sh

set -eu

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
ROOT_DIR="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

read_packages() {
  package_file="$1"

  if [ ! -f "$package_file" ]; then
    echo "Package file not found: $package_file" >&2
    return 1
  fi

  sed \
    -e '/^[[:space:]]*$/d' \
    -e '/^[[:space:]]*#/d' \
    "$package_file"
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
  package_file="$ROOT_DIR/packages/macos.txt"

  if ! command_exists brew; then
    echo "Homebrew is not installed."
    echo "Install Homebrew first:"
    echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    exit 1
  fi

  if ! packages="$(read_packages "$package_file")"; then
    exit 1
  fi

  if [ -z "$packages" ]; then
    echo "No macOS packages to install."
    return 0
  fi

  set -- $packages
  brew install "$@"
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
  package_file="$ROOT_DIR/packages/arch.txt"

  bootstrap_yay

  if ! packages="$(read_packages "$package_file")"; then
    exit 1
  fi

  if [ -z "$packages" ]; then
    echo "No Arch packages to install."
    return 0
  fi

  set -- $packages
  yay -S --needed "$@"
}

OS="$(detect_os)"

case "$OS" in
  macos)
    install_macos
    ;;
  arch|endeavouros|manjaro)
    install_arch
    ;;
  *)
    echo "Unsupported OS: $OS"
    echo "Supported targets: macOS, Arch-based Linux"
    exit 1
    ;;
esac
