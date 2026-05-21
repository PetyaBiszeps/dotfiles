# ~/.config/zsh/plugins/fzf.zsh

if command_exists fzf; then
  source_first_existing \
    "/opt/homebrew/opt/fzf/shell/key-bindings.zsh" \
    "/usr/share/fzf/key-bindings.zsh"

  source_first_existing \
    "/opt/homebrew/opt/fzf/shell/completion.zsh" \
    "/usr/share/fzf/completion.zsh"
fi
