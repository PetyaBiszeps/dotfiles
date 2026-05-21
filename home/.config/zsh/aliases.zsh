# ~/.config/zsh/aliases.zsh

# -------------------------------------------------------------------
# Navigation
# -------------------------------------------------------------------

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# -------------------------------------------------------------------
# Listing
# -------------------------------------------------------------------

if command_exists eza; then
  alias ls="eza --icons --group-directories-first"
  alias l="eza --icons --group-directories-first --oneline"
  alias la="eza --icons --group-directories-first --all"
  alias ll="eza --icons --group-directories-first --all --long --git"
  alias lt="eza --icons --group-directories-first --tree --level=2"
else
  alias l="ls -CF"
  alias la="ls -A"
  alias ll="ls -lah"
fi

# -------------------------------------------------------------------
# Search
# -------------------------------------------------------------------

alias grep="grep --color=auto"

# -------------------------------------------------------------------
# Cleanup
# -------------------------------------------------------------------

alias cleands="rmds"
