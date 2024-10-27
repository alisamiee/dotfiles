#!/usr/bin/env bash

stow --no-folding configs --target="$HOME"
stow --no-folding bin --target="$HOME"

wallpapers_dir=$HOME/Pictures/wallpapers
mkdir -p "$wallpapers_dir"
cp ./wallpapers/* "$wallpapers_dir"

sh ./fonts.sh

mkdir $HOME/dev
