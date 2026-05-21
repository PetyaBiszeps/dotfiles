# ~/.config/zsh/plugins/zoxide.zsh

if command_exists zoxide; then
  eval "$(zoxide init zsh --cmd cd)"
  alias e="z"
fi
