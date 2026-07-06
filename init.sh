#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Applying dotfiles"
sh "$DOTFILES_DIR/scripts/apply.sh"

echo "==> Applying wallpapers"
sh "$DOTFILES_DIR/scripts/wallpapers.sh"

if [ ! -f "$DOTFILES_DIR/home/.config/git/user" ]; then
  echo "==> Creating local Git config"
  sh "$DOTFILES_DIR/scripts/git.sh"
else
  echo "==> Local Git config already exists"
fi

echo "==> Done"
