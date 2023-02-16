#!/bin/zsh

export MANPAGER='nvim +Man!'
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#d6d6d6,bg:#030303,hl:#5f87af
 --color=fg+:#e8e8e8,bg+:#313244,hl+:#3bceff
 --color=info:#afaf87,prompt:#d7005f,pointer:#b061ff
 --color=marker:#87ff00,spinner:#972eff,header:#87afaf'
 
# Paths
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"
export PATH=$PATH:$HOME/.local/share/cargo/bin

# Default programs
export EDITOR="nvim"
export TERM="xterm-256color"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export LESSHISTFILE="-"
#export LESS="-R"

#export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
#export KODI_DATA="$XDG_DATA_HOME/kodi"
#export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

export GOPATH="$XDG_DATA_HOME/.local/share/go"
export CARGO_HOME="$XDG_DATA_HOME/.local/share/cargo"
