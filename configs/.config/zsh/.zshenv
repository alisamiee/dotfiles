typeset -U path PATH
path=(~/.local/share/cargo/bin ~/.local/bin $path)
# export PATH

# ------------------------------ XDG Directories ----------------------------- #
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

# ------------------------------- Home clean-up ------------------------------ #
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE="$XDG_CONFIG_HOME"/zsh/history
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/zsh/starship.toml

# ------------------------------ General exports ----------------------------- #
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export MANPAGER='nvim +Man!'
export MANWIDTH=900
