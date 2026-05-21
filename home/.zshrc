# ~/.zshrc

# -------------------------------------------------------------------
# Zsh options
# -------------------------------------------------------------------

# Keep PATH entries unique
typeset -U path PATH

# Theme name for tools that read ZSH_THEME
ZSH_THEME="apple"

# -------------------------------------------------------------------
# Helpers
# -------------------------------------------------------------------

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

path_prepend() {
  [[ -n "$1" && -d "$1" ]] && path=("$1" "${path[@]}")
}

source_if_exists() {
  [[ -f "$1" ]] && source "$1"
}

source_first_existing() {
  local file

  for file in "$@"; do
    if [[ -f "$file" ]]; then
      source "$file"
      return 0
    fi
  done

  return 1
}

# -------------------------------------------------------------------
# Platform
# -------------------------------------------------------------------

case "$(uname -s)" in
  Darwin)
    export DOTFILES_OS="macos"
    ;;
  Linux)
    export DOTFILES_OS="linux"
    ;;
  *)
    export DOTFILES_OS="unknown"
    ;;
esac

# -------------------------------------------------------------------
# XDG
# -------------------------------------------------------------------

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# -------------------------------------------------------------------
# Base PATH
# -------------------------------------------------------------------

path_prepend "$HOME/.local/bin"
path_prepend "$HOME/bin"

# -------------------------------------------------------------------
# Homebrew
# macOS: /opt/homebrew or /usr/local
# Linuxbrew: /home/linuxbrew/.linuxbrew
# -------------------------------------------------------------------

if command_exists brew; then
  export HOMEBREW_PREFIX="$(brew --prefix)"

  path_prepend "$HOMEBREW_PREFIX/bin"
  path_prepend "$HOMEBREW_PREFIX/sbin"
fi

# -------------------------------------------------------------------
# Zsh plugins
# Works with Homebrew, Arch/yay/pacman, Fedora/dnf when packages exist
# -------------------------------------------------------------------

source_first_existing \
  "${HOMEBREW_PREFIX:-}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh" \
  "/usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh" \
  "/usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

source_first_existing \
  "${HOMEBREW_PREFIX:-}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# -------------------------------------------------------------------
# fzf
# -------------------------------------------------------------------

if command_exists fzf; then
  source <(fzf --zsh)
fi

# -------------------------------------------------------------------
# Prompt
# -------------------------------------------------------------------

if command_exists oh-my-posh; then
  OMP_THEME="$XDG_CONFIG_HOME/oh-my-posh/theme.omp.json"

  if [[ -f "$OMP_THEME" && -s "$OMP_THEME" ]]; then
    eval "$(oh-my-posh init zsh --config "$OMP_THEME")"
  else
    eval "$(oh-my-posh init zsh)"
  fi
fi

# -------------------------------------------------------------------
# Shell history
# -------------------------------------------------------------------

if command_exists atuin; then
  eval "$(atuin init zsh)"
fi

# -------------------------------------------------------------------
# pnpm
# -------------------------------------------------------------------

case "$DOTFILES_OS" in
  macos)
    export PNPM_HOME="${PNPM_HOME:-$HOME/Library/pnpm}"
    ;;
  linux)
    export PNPM_HOME="${PNPM_HOME:-$XDG_DATA_HOME/pnpm}"
    ;;
esac

path_prepend "$PNPM_HOME"

# -------------------------------------------------------------------
# opencode
# -------------------------------------------------------------------

path_prepend "$HOME/.opencode/bin"

# -------------------------------------------------------------------
# Java
# -------------------------------------------------------------------

# On Linux Java is usually already linked into PATH by pacman/dnf.
# On macOS Homebrew keeps OpenJDK keg-only, so add it when available.
if [[ "$DOTFILES_OS" == "macos" ]]; then
  path_prepend "${HOMEBREW_PREFIX:-}/opt/openjdk/bin"
fi

# -------------------------------------------------------------------
# Export PATH
# -------------------------------------------------------------------

export PATH
