#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"
NVIM_MODULE="$DOTFILES_DIR/modules/nvim"

echo "==> Initializing modules"

git -C "$DOTFILES_DIR" submodule update --init --recursive modules/nvim

echo "==> Initializing Neovim"
sh "$NVIM_MODULE/init.sh"
