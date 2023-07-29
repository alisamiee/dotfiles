#!/bin/sh
alias sudo="sudo "
alias please="sudo "
alias update="yay -Syyu"
alias vim="nvim"
alias lsa="ls -lah"

alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# For when keys break
alias fix-keyring="sudo pacman -Syy && sudo pacman -S archlinux-keyring"

alias ccpp="g++ -ggdb -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror -std=c++20"
