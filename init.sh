#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Running setup"
sh "$DOTFILES_DIR/scripts/setup.sh"

echo "==> Applying dotfiles"
sh "$DOTFILES_DIR/scripts/apply.sh"

echo "==> Done"
