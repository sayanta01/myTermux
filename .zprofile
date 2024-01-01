#!/bin/zsh

export MANPAGER='nvim +Man!'

# Paths
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

# Default programs
export EDITOR="nvim"
export TERM="xterm-256color"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LESSHISTFILE="-"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export GOPATH="$XDG_DATA_HOME/.local/share/go"
