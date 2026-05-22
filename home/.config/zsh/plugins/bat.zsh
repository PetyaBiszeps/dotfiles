# ~/.config/zsh/plugins/bat.zsh

if command_exists bat; then
  alias cat="bat"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export MANROFFOPT="-c"
elif command_exists batcat; then
  alias bat="batcat"
  alias cat="batcat"
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
  export MANROFFOPT="-c"
fi
