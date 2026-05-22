# ~/.config/zsh/plugins/yazi.zsh

if command_exists yazi; then
  e() {
    local tmp cwd

    tmp="$(mktemp -t yazi-cwd.XXXXXX)"

    yazi "$@" --cwd-file="$tmp"

    if [[ -f "$tmp" ]]; then
      cwd="$(cat "$tmp")"
      rm -f "$tmp"

      if [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
        cd "$cwd" || return
      fi
    fi
  }

  E() {
    e "$@"
  }
fi
