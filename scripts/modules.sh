#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"
NVIM_MODULE="$DOTFILES_DIR/modules/nvim"
AI_MODULE="$DOTFILES_DIR/modules/ai"

echo "==> Initializing modules"

git -C "$DOTFILES_DIR" submodule update --init --recursive \
  modules/nvim \
  modules/ai

echo "==> Initializing Neovim"
sh "$NVIM_MODULE/init.sh"

echo "==> Initializing AI"
sh "$AI_MODULE/init.sh"
