# ~/.config/zsh/plugins/yazi.zsh

if command_exists yazi; then
  e() {
    local target="${1:-.}"

    if [[ $# -eq 0 ]]; then
      yazi
      return
    fi

    if command_exists zoxide; then
      local dir
      dir="$(zoxide query "$target" 2>/dev/null)" || return
      yazi "$dir"
    else
      yazi "$target"
    fi
  }
fi
