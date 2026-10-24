#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"

NVIM_DIR="$DOTFILES_DIR/modules/nvim"
AI_DIR="$DOTFILES_DIR/modules/ai"

sync_repo() {
  repo="$1"
  dir="$2"

  if [ -d "$dir/.git" ]; then
    git -C "$dir" switch main
    git -C "$dir" pull --ff-only
  else
    git clone --branch main "$repo" "$dir"
  fi
}

sync_repo "git@github.com:PetyaBiszeps/nvim.config.git" "$NVIM_DIR"
sync_repo "git@github.com:PetyaBiszeps/ai.config.git" "$AI_DIR"

echo "==> Initializing Neovim"
sh "$NVIM_DIR/init.sh"

echo "==> Initializing AI"
sh "$AI_DIR/init.sh"
