# ~/.config/zsh/plugins.zsh

# -------------------------------------------------------------------
# zsh-autocomplete
# -------------------------------------------------------------------

source_first_existing \
  "${HOMEBREW_PREFIX:-}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh" \
  "/usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh" \
  "/usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# -------------------------------------------------------------------
# zsh-autosuggestions
# -------------------------------------------------------------------

source_first_existing \
  "${HOMEBREW_PREFIX:-}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# -------------------------------------------------------------------
# Plugin configurations
# -------------------------------------------------------------------

source_if_exists "$ZSH_CONFIG_HOME/plugins/yazi.zsh"
# source_if_exists "$ZSH_CONFIG_HOME/plugins/fzf.zsh"
source_if_exists "$ZSH_CONFIG_HOME/plugins/zoxide.zsh"
# source_if_exists "$ZSH_CONFIG_HOME/plugins/atuin.zsh"
