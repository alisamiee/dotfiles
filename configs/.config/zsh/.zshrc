#!/usr/bin/env zsh

# history gets set by supercharge so no need
# export HISTFILE="$ZDOTDIR/history"
# HISTSIZE=10000
# SAVEHIST=10000
export PLUGIN_DIR="$ZDOTDIR/plugins"

source "$ZDOTDIR/aliases"
source "$PLUGIN_DIR/highlighting-colors.zsh"
source "$PLUGIN_DIR/prompt.zsh"

source "$PLUGIN_DIR/autosuggestions/zsh-autosuggestions.plugin.zsh"
source "$PLUGIN_DIR/autopair/zsh-autopair.plugin.zsh"
source "$PLUGIN_DIR/supercharge/supercharge.plugin.zsh"
source "$PLUGIN_DIR/vim/vim.plugin.zsh"
source "$PLUGIN_DIR/fzf/fzf.plugin.zsh"
source "$PLUGIN_DIR/exa/eza.plugin.zsh"
source "$PLUGIN_DIR/syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
source "$PLUGIN_DIR/history-substring-search/zsh-history-substring-search.plugin.zsh"
source "$PLUGIN_DIR/nvm/zsh-nvm.plugin.zsh"

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey -s "^F" "tmux-sessionizer\n"
