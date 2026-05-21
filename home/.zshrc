# ~/.zshrc

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
# Zsh modules
# -------------------------------------------------------------------

ZSH_CONFIG_HOME="$XDG_CONFIG_HOME/zsh"

source_if_exists "$ZSH_CONFIG_HOME/functions.zsh"
source_if_exists "$ZSH_CONFIG_HOME/exports.zsh"
source_if_exists "$ZSH_CONFIG_HOME/aliases.zsh"
source_if_exists "$ZSH_CONFIG_HOME/completions.zsh"
source_if_exists "$ZSH_CONFIG_HOME/plugins.zsh"
source_if_exists "$ZSH_CONFIG_HOME/theme.zsh"
