#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history gets set by supercharge so no need
# export HISTFILE="$XDG_CONFIG_HOME"/zsh/history
# HISTSIZE=10000
# SAVEHIST=10000

# personal scripts
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/plugins/highlighting-colors.zsh"
# plug "$HOME/.config/zsh/plugins/prompt.zsh"

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

eval "$(starship init zsh)"
