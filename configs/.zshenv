typeset -U path PATH
path=(~/.local/share/cargo/bin ~/.local/bin $path)
# export to sub-processes (make it inherited by child processes)
export PATH

# ------------------------------- Home clean-up ------------------------------ #
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export HISTFILE="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/history"
export GTK_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-1.0/gtkrc"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME:-$HOME/.cache}/nv"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export XAUTHORITY="${XDG_RUNTIME_DIR:/run/user/$UID}/Xauthority"

# ------------------------------ General exports ----------------------------- #
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export MANPAGER='nvim +Man!'
