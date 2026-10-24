#!/usr/bin/env sh

sync_repo() {
  repo="$1"
  dir="$2"

  if [ -d "$dir/.git" ]; then
    git -C "$dir" checkout main
    git -C "$dir" pull --ff-only
  else
    git clone --branch main "$repo" "$dir"
  fi
}
