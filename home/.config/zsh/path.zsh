# ~/.config/zsh/path.zsh

# User binaries
path_prepend "$HOME/.local/bin"
path_prepend "$HOME/bin"

# Language / toolchain binaries
path_prepend "$HOME/.cargo/bin"
path_prepend "$HOME/go/bin"
path_prepend "$HOME/.npm-global/bin"

# macOS Homebrew
if [[ "$DOTFILES_OS" == "macos" ]]; then
  path_prepend "/opt/homebrew/bin"
  path_prepend "/opt/homebrew/sbin"
  path_prepend "/usr/local/bin"
  path_prepend "/usr/local/sbin"
fi

export PATH
