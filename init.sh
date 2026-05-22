#!/usr/bin/env sh

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

set_default_shell() {
  if ! command_exists zsh; then
    echo "Skip: zsh is not installed"
    return 0
  fi

  zsh_path="$(command -v zsh)"

  if [ "${SHELL:-}" = "$zsh_path" ]; then
    echo "Default shell is already zsh: $zsh_path"
    return 0
  fi

  if ! grep -qx "$zsh_path" /etc/shells 2>/dev/null; then
    echo "Adding zsh to /etc/shells: $zsh_path"
    echo "$zsh_path" | sudo tee -a /etc/shells >/dev/null
  fi

  echo "Changing default shell to: $zsh_path"
  chsh -s "$zsh_path"

  echo "Default shell changed. Log out and log back in to apply it."
}

echo "==> Installing dependencies"
sh "$DOTFILES_DIR/scripts/setup.sh"

echo "==> Applying dotfiles"
sh "$DOTFILES_DIR/scripts/apply.sh"

if [ ! -f "$DOTFILES_DIR/home/.config/git/user" ]; then
  echo "==> Creating local config"
  sh "$DOTFILES_DIR/scripts/local.sh"
fi

echo "==> Checking dotfiles"
sh "$DOTFILES_DIR/scripts/doctor.sh"

echo "==> Setting default shell"
set_default_shell

echo "==> Done"
