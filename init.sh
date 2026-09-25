#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# echo "==> Applying dotfiles"
# sh "$DOTFILES_DIR/scripts/apply.sh"

# echo "==> Preparing local files"
# sh "$DOTFILES_DIR/scripts/local.sh"

# echo "==> Applying wallpapers"
# sh "$DOTFILES_DIR/scripts/wallpapers.sh"

echo "==> Configuring Git"
sh "$DOTFILES_DIR/scripts/git.sh"

echo "==> Done"
