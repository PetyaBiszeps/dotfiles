#!/usr/bin/env sh

set -u

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

OK_COUNT=0
WARN_COUNT=0

ok() {
  OK_COUNT=$((OK_COUNT + 1))
  printf '[OK]   %s\n' "$1"
}

warn() {
  WARN_COUNT=$((WARN_COUNT + 1))
  printf '[WARN] %s\n' "$1"
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

check_command() {
  name="$1"

  if command_exists "$name"; then
    ok "command found: $name"
  else
    warn "command missing: $name"
  fi
}

check_optional_command() {
  name="$1"

  if command_exists "$name"; then
    ok "optional command found: $name"
  else
    warn "optional command missing: $name"
  fi
}

check_path_entry() {
  dir="$1"

  if [ ! -d "$dir" ]; then
    warn "PATH directory does not exist yet: $dir"
    return 0
  fi

  case ":$PATH:" in
    *":$dir:"*)
      ok "PATH contains: $dir"
      ;;
    *)
      warn "PATH missing: $dir"
      ;;
  esac
}

check_symlink() {
  src="$1"
  dest="$2"

  if [ ! -e "$src" ]; then
    warn "source missing: $src"
    return 0
  fi

  if [ ! -e "$dest" ] && [ ! -L "$dest" ]; then
    warn "target missing: $dest"
    return 0
  fi

  if [ ! -L "$dest" ]; then
    warn "target is not a symlink: $dest"
    return 0
  fi

  actual="$(readlink "$dest")"

  if [ "$actual" = "$src" ]; then
    ok "linked: $dest -> $src"
  else
    warn "wrong symlink: $dest -> $actual"
    warn "expected: $dest -> $src"
  fi
}

check_file() {
  file="$1"

  if [ -f "$file" ]; then
    ok "file exists: $file"
  else
    warn "file missing: $file"
  fi
}

check_script_syntax() {
  file="$1"

  if [ ! -f "$file" ]; then
    warn "script missing: $file"
    return 0
  fi

  if sh -n "$file" 2>/dev/null; then
    ok "shell syntax ok: $file"
  else
    warn "shell syntax failed: $file"
  fi
}

echo "==> Dotfiles doctor"
echo

echo "==> Commands"
check_command zsh
check_command git
check_command nvim
check_command eza
check_command fzf
check_command atuin
check_command zoxide
check_command yazi
check_command tmux
check_command oh-my-posh

check_optional_command rg
check_optional_command fd
check_optional_command bat
check_optional_command batman
check_optional_command batpipe
check_optional_command batdiff
check_optional_command batgrep
check_optional_command prettybat
check_optional_command ghostty

echo
echo "==> PATH"
check_path_entry "$HOME/.local/bin"
check_path_entry "$HOME/bin"
check_path_entry "$HOME/.cargo/bin"
check_path_entry "$HOME/go/bin"
check_path_entry "$HOME/.npm-global/bin"

echo
echo "==> Symlinks"
check_symlink "$DOTFILES_DIR/home/.zshrc" "$HOME/.zshrc"
check_symlink "$DOTFILES_DIR/home/.config/zsh" "$HOME/.config/zsh"
check_symlink "$DOTFILES_DIR/home/.config/oh-my-posh" "$HOME/.config/oh-my-posh"
check_symlink "$DOTFILES_DIR/home/.config/atuin" "$HOME/.config/atuin"
check_symlink "$DOTFILES_DIR/home/.config/nvim" "$HOME/.config/nvim"
check_symlink "$DOTFILES_DIR/home/.config/ghostty" "$HOME/.config/ghostty"
check_symlink "$DOTFILES_DIR/home/.config/git" "$HOME/.config/git"
check_symlink "$DOTFILES_DIR/home/.config/yazi" "$HOME/.config/yazi"
check_symlink "$DOTFILES_DIR/home/.config/tmux" "$HOME/.config/tmux"
check_symlink "$DOTFILES_DIR/home/.config/zed" "$HOME/.config/zed"

echo
echo "==> Important files"
check_file "$HOME/.config/atuin/config.toml"
check_file "$HOME/.gitconfig"
check_file "$HOME/.config/git/user"
check_file "$HOME/.config/git/config"
check_file "$HOME/.config/git/ignore"
check_file "$HOME/.config/nvim/init.lua"
check_file "$HOME/.config/yazi/yazi.toml"
check_file "$HOME/.config/yazi/keymap.toml"
check_file "$HOME/.config/tmux/tmux.conf"
check_file "$HOME/.config/zed/settings.json"
check_file "$HOME/.config/zed/keymap.json"

echo
echo "==> Script syntax"
check_script_syntax "$DOTFILES_DIR/init.sh"
check_script_syntax "$DOTFILES_DIR/scripts/setup.sh"
check_script_syntax "$DOTFILES_DIR/scripts/apply.sh"
check_script_syntax "$DOTFILES_DIR/scripts/doctor.sh"

echo
echo "==> Atuin"
if command_exists atuin; then
  if atuin config get style --resolved >/dev/null 2>&1; then
    ok "atuin config is readable"
  else
    warn "atuin config is not readable"
  fi
else
  warn "cannot check atuin config because atuin is missing"
fi

echo
echo "==> Git"
if command_exists git; then
  if git config --global --includes --get core.editor >/dev/null 2>&1; then
    ok "git dotfiles config is included"
  else
    warn "git dotfiles config may not be included"
  fi

  git_name="$(git config --global --includes user.name 2>/dev/null || true)"
  git_email="$(git config --global --includes user.email 2>/dev/null || true)"

  if [ -n "$git_name" ]; then
    ok "git user.name configured: $git_name"
  else
    warn "git user.name is not configured"
  fi

  if [ -n "$git_email" ]; then
    ok "git user.email configured: $git_email"
  else
    warn "git user.email is not configured"
  fi
else
  warn "cannot check git config because git is missing"
fi

echo
echo "==> Zsh integration"
if [ -d "$HOME/.config/zsh" ]; then
  if grep -R "atuin init zsh" "$HOME/.config/zsh" >/dev/null 2>&1; then
    ok "atuin zsh integration found"
  else
    warn "atuin zsh integration not found"
  fi

  if grep -R "zoxide init zsh" "$HOME/.config/zsh" >/dev/null 2>&1; then
    ok "zoxide zsh integration found"
  else
    warn "zoxide zsh integration not found"
  fi
else
  warn "zsh config directory missing"
fi

echo
echo "==> Summary"
echo "OK:   $OK_COUNT"
echo "WARN: $WARN_COUNT"

exit 0
