# ~/.config/zsh/completions.zsh

autoload -Uz compinit

if [[ -n "$ZDOTDIR" ]]; then
  compinit -d "$ZDOTDIR/.zcompdump"
else
  compinit -d "$HOME/.zcompdump"
fi
