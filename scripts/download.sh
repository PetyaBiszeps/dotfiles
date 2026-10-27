#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"

. "$DOTFILES_DIR/scripts/utils/install/arch.sh"
. "$DOTFILES_DIR/scripts/utils/install/macos.sh"

case "$(uname -s)" in
  Darwin)
    install_macos
    ;;

  Linux)
    if ! command -v yay >/dev/null 2>&1; then
      echo "Error: yay is required for Arch-based systems"
      exit 1
    fi

    install_arch
    ;;

  *)
    echo "Unsupported operating system: $(uname -s)"
    exit 1
    ;;
esac

echo "==> Done"
