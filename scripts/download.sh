#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"

. "$DOTFILES_DIR/scripts/utils/platform.sh"
. "$DOTFILES_DIR/scripts/utils/install/arch.sh"
. "$DOTFILES_DIR/scripts/utils/install/macos.sh"

case "$PLATFORM" in
  macos)
    install_macos
    ;;

  linux)
    if ! command -v yay >/dev/null 2>&1; then
      echo "Error: yay is required for Arch-based systems" >&2
      exit 1
    fi

    install_arch
    ;;
esac

echo "==> Done"
