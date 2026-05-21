# -------------------------------------------------------------------
# Oh My Posh
# -------------------------------------------------------------------

if command_exists oh-my-posh; then
  OMP_THEME="$XDG_CONFIG_HOME/oh-my-posh/theme.omp.json"

  if [[ -f "$OMP_THEME" && -s "$OMP_THEME" ]]; then
    eval "$(oh-my-posh init zsh --config "$OMP_THEME")"
  else
    eval "$(oh-my-posh init zsh)"
  fi
fi
