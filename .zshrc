# cowsay "$(shuf -n 1 ~/.local/share/vocab/words.txt)"

#setopt correct              # auto correct mistakes
#setopt autocd               # change directory just by typing its name
#setopt interactivecomments  # allow comments in interactive mode
setopt extendedglob
setopt magicequalsubst      # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch            # hide error message if there is no match for the pattern
setopt notify               # report the status of background jobs immediately
setopt numericglobsort      # sort filenames numerically when it makes sense
setopt promptsubst          # enable command substitution in prompt

# Configure keybindings
bindkey -e                                        # emacs key bindings
bindkey -s '^o' 'lf^M'
bindkey -s '^r' 'hst^M'
bindkey -s '^t' 'tmux^M'
bindkey ' ' magic-space                           # history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + u
bindkey '^[[3;5~' kill-word                       # backward del
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + Tab undo last action
bindkey '^K' kill-line

#bindkey "^A" vi-beginning-of-line
#bindkey '^E' end-of-line
#bindkey '^H' backward-kill-word                   # forward del word 
#bindkey '^K' kill-line
#bindkey '^B' backward-char
#bindkey '^F' forward-char
#bindkey '^N' down-line-or-history
#bindkey '^P' up-line-or-history
#bindkey '^O' forward-word
#bindkey '^J' backward-word
#bindkey '^I' expand-or-complete
#bindkey '^T' transpose-chars
#bindkey '^R' history-incremental-search-backward
#bindkey '^D' exit_zsh

# Hide EOL sign ('%')
#PROMPT_EOL_MARK="" 

# Time format
TIMEFMT=$'\ntotal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# Enable completion 
autoload -Uz compinit && compinit
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files
zstyle ':completion:*' menu select
zstyle ':completion:*' list-prompt %S TAB for more
zstyle ':completion:*' verbose true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# History configurations
HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zsh_history
setopt hist_ignore_space       # ignore commands that start with space
setopt hist_expire_dups_first  # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups    # ignore duplicated commands history list
setopt hist_verify             # show command with history expansion to user before running it

# Plugins
source ~/.zprofile
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Prompt
autoload -Uz vcs_info colors && colors
precmd() { vcs_info }
setopt prompt_subst

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' 
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"

PROMPT=' %b%{$fg[yellow]%}❯${vcs_info_msg_0_}%  '
#PROMPT=' %b%{$fg[red]%}(%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M%{$fg[white]%}  %{$fg[red]%})%{$fg[white]%} ${vcs_info_msg_0_} ~%  '
# %b  %{$fg[red]%}(  %{$fg[yellow]%}%n  %{$fg[green]%}@  %{$fg[magenta]%}%M   %{$fg[white]%}   %{$fg[red]%})  %{$fg[white]%}


##### ALIAS #####
alias fix="dpkg --configure -a; apt --fix-broken install -y; apt install -f; apt update --fix-missing"
alias install="apt install"
alias update="apt update && apt upgrade"
alias clean="apt -y autoremove; apt clean"
alias remove="apt remove --purge"

alias reload="termux-reload-settings"
alias terper="termux-setup-storage"
alias pf="cd $PREFIX"
alias st="cd $HOME/storage"

alias la="exa --icons"
alias ls="ls --color=auto"
alias lt="exa --icons --tree"
alias ll="exa --icons -lgha --group-directories-first"
alias lm="ls -t -1"
alias lsn="exa | wc -l"
alias l-="ls -l | grep -v 'd'"
alias ld="ls -l | grep '^d'"
alias l.="ls -A | grep '^\.'"

alias ..="cd .."
alias ...="cd ../.."
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias del="gio trash"
alias tre="trash-restore"
alias cr="clear"
alias less="less -R"
alias mkdir="mkdir -pv"
alias logout='pkill -u "$USER"'

alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip --color=auto"

alias add.="git add ."
alias addup="git add -u"
alias branch="git branch"
alias checkout="git checkout"
alias clone="git clone"
alias commit="git commit -m"
alias fetch="git fetch"
alias status="git status"
alias tag="git tag"
alias newtag="git tag -a"
alias pull="git pull origin"
alias push="git push origin"

alias rr="curl https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
alias tb="nc termbin.com 9999"
cht() {
	sh -c "curl cheat.sh/$1"
}
wttr() {
  sh -c "curl wttr.in/$1"
}
rate() {
  sh -c "curl rate.sx/$1"
}
alias myip="curl ifconfig.me; echo"
alias php-server="php -S 0.0.0.0:8000"
alias py-server="python -m http.server 8000"
alias multitail="multitail --no-repeat -c"

alias ff="fd --type f --hidden --exclude .git | fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" | xargs -r "$EDITOR""
alias fonts="magick convert -list font | grep -iE 'font:.*'"
alias bigfile="du -hxs * | sort -rh | head"
alias hst="history 0 | tac | cut -c 8- | fzf | tr -d '\n' | xclip -sel c"
alias psmem="ps axch -o cmd,%mem --sort=-%mem | head"
alias pscpu="ps axch -o cmd,%cpu --sort=-%cpu | head"

alias ping="ping -c 6"
alias ports="netstat -tulanp"
alias copy="rsync --progress -auv"

alias df="df -h"
alias du="du -h"
alias free="free -h"
alias bc="bc -ql"
alias shred="shred -uvzn3"
alias bat="bat --theme OneHalfDark"
alias cat="bat --theme OneHalfDark -p"
alias pu="pushd"
alias po="popd"
alias ffmpeg="ffmpeg -hide_banner"
alias ffplay="ffplay -hide_banner"
alias ffprobe="ffprobe -hide_banner"
alias wget="wget --hsts-file=/dev/null"

alias iv="termimage"
alias vim="nvim"
alias mpc="mpd 2>/dev/null; ncmpcpp"
alias ytdl-vid="yt-dlp -f bestvideo+bestaudio"
alias ytdl-aud="yt-dlp --extract-audio --audio-format m4a"
