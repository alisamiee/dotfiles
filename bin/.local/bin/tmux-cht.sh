#!/usr/bin/env bash

selected=`cat ~/.local/bin/cht-langs ~/.local/bin/cht-cmds | fzf`

read -p "Query: " query

if grep -qs "$selected" ~/.local/bin/cht-langs; then
    query=`echo $query | tr ' ' '+'`
    tmux new-window bash -c "curl -s cht.sh/$selected/$query | less -r"
else
    tmux new-window bash -c "curl -s cht.sh/$selected~$query | less -r"
fi
