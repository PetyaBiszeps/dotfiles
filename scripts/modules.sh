#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"
NVIM_DIR="$DOTFILES_DIR/modules/nvim.config"
AI_DIR="$DOTFILES_DIR/modules/ai.config"

. "$DOTFILES_DIR/scripts/utils/sync.sh"

sync_repo "git@github.com:PetyaBiszeps/nvim.config.git" "$NVIM_DIR"
sync_repo "git@github.com:PetyaBiszeps/ai.config.git" "$AI_DIR"

echo "==> Initializing Neovim"
sh "$NVIM_DIR/init.sh"

echo "==> Initializing AI"
sh "$AI_DIR/init.sh"
