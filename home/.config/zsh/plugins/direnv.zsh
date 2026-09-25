# ~/.config/zsh/plugins/direnv.zsh

if command_exists direnv; then
  eval "$(direnv hook zsh)"
fi
