# ~/.config/zsh/plugins/bat.zsh

if command_exists bat; then
  alias cat="bat --paging=never"
  export MANPAGER="bat -plman"
elif command_exists batcat; then
  alias bat="batcat"
  alias cat="batcat --paging=never"
  export MANPAGER="batcat -plman"
fi
