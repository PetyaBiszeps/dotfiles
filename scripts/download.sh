#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"

. "$DOTFILES_DIR/utils/install/macos.sh"

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
