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
    fd \
    zsh \
    git \
    bat \
    eza \
    fzf \
    php \
    curl \
    yazi \
    tmux \
    mise \
    rust \
    ruby \
    atuin \
    julia \
    neovim \
    zoxide \
    direnv \
    openjdk \
    ripgrep \
    composer \
    luarocks \
    bat-extras \
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
    fd \
    zsh \
    git \
    npm \
    bat \
    eza \
    fzf \
    gcc \
    php \
    curl \
    make \
    yazi \
    tmux \
    mise \
    rust \
    ruby \
    atuin \
    unzip \
    julia \
    neovim \
    zoxide \
    direnv \
    ripgrep \
    composer \
    luarocks \
    bat-extras \
    oh-my-posh \
    jdk-openjdk \
    wl-clipboard \
    tree-sitter-cli \
    zsh-autocomplete \
    zsh-autosuggestions
}

install_fedora() {
  if ! command_exists dnf; then
    echo "dnf is required on Fedora."
    exit 1
  fi

  sudo dnf install -y \
    zsh \
    git \
    npm \
    bat \
    eza \
    fzf \
    gcc \
    php \
    curl \
    make \
    yazi \
    tmux \
    mise \
    rust \
    ruby \
    atuin \
    unzip \
    julia \
    neovim \
    zoxide \
    direnv \
    gcc-c++ \
    fd-find \
    ripgrep \
    composer \
    luarocks \
    oh-my-posh \
    ruby-devel \
    wl-clipboard \
    tree-sitter-cli \
    zsh-autosuggestions \
    java-latest-openjdk-devel \

  if ! command_exists mise; then
    curl https://mise.run | sh
  fi

  if ! command_exists fd && command_exists fdfind; then
    mkdir -p "$HOME/.local/bin"
    ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
  fi

  echo "WARN: bat-extras is not installed automatically on Fedora."
  echo "WARN: Install it manually if needed, for example via a trusted COPR or upstream method."

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
