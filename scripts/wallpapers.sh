#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SRC_DIR="$DOTFILES_DIR/assets/wallpapers"
DEST_DIR="$HOME/Pictures/Wallpapers"

echo "==> Linking wallpapers"

if [ ! -d "$SRC_DIR" ]; then
  echo "Skip: wallpapers source does not exist: $SRC_DIR"
  exit 0
fi

if [ -L "$DEST_DIR" ] || [ -e "$DEST_DIR" ]; then
  rm -rf "$DEST_DIR"
fi

mkdir -p "$(dirname "$DEST_DIR")"
ln -s "$SRC_DIR" "$DEST_DIR"

echo "Linked: $DEST_DIR -> $SRC_DIR"
