#!/usr/bin/env sh

case "$(uname -s)" in
  Darwin)
    PLATFORM="macos"
    ZSH_PATH="/bin/zsh"
    ;;
  Linux)
    PLATFORM="linux"
    ZSH_PATH="/usr/bin/zsh"
    ;;
  *)
    echo "Unsupported platform: $(uname -s)" >&2
    exit 1
    ;;
esac
