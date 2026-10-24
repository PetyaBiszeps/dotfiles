#!/usr/bin/env sh

set -eu

ZSH_LOCAL_FILE="$HOME/.zshrc.local"

echo "==> Preparing local files"

if [ ! -f "$ZSH_LOCAL_FILE" ]; then
  touch "$ZSH_LOCAL_FILE"
  echo "Created: $ZSH_LOCAL_FILE"
else
  echo "Already exists: $ZSH_LOCAL_FILE"
fi
