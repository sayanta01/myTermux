cowsay "$(shuf -n 1 ~/.local/share/vocab/words.txt)"

#setopt correct              # auto correct mistakes
setopt autocd               # change directory just by typing its name
setopt interactivecomments  # allow comments in interactive mode
setopt magicequalsubst      # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch            # hide error message if there is no match for the pattern
setopt notify               # report the status of background jobs immediately
setopt numericglobsort      # sort filenames numerically when it makes sense
setopt promptsubst          # enable command substitution in prompt

# Configure keybindings
bindkey -e                                        # emacs key bindings
bindkey -s '^o' 'ranger^M'
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
source ~/.config/zsh/zsh-fzf-history-search.zsh 2>/dev/null
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

PROMPT=' %b%{$fg[green]%}%{$fg[red]%}${vcs_info_msg_0_}%  '
#PROMPT=' %b%{$fg[red]%}(%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M%{$fg[white]%}  %{$fg[red]%})%{$fg[white]%} ${vcs_info_msg_0_} ~%  '
# %b  %{$fg[red]%}(  %{$fg[yellow]%}%n  %{$fg[green]%}@  %{$fg[magenta]%}%M   %{$fg[white]%}   %{$fg[red]%})  %{$fg[white]%}


##### ALIAS #####
alias fix='sudo dpkg --configure -a; sudo apt --fix-broken install -y; sudo apt install -f; sudo apt update --fix-missing'
alias clean='sudo apt -y autoremove; sudo apt clean'

alias reload="termux-reload-settings"
alias terper="termux-setup-storage"
alias bigfile="du -h -x -s -- * | sort -r -h | head -20"
alias pf="cd $PREFIX"
alias st="cd /storage"

alias ll="exa --icons -lgha --group-directories-first"
alias lm='ls -t -1'
alias l.='exa -a | egrep "^\."'
alias ls='ls --color=auto'
alias la='exa --icons'
alias lt="exa --icons --tree"
alias lsn='exa | wc -l'

alias cp="cp -iv"
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'

alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'
alias tag='git tag'
alias newtag='git tag -a'

alias rr='curl https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias hst="history 1 -1 | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -sel c"
alias fonts="magick convert -list font | grep -iE 'font:.*'"
alias typer='xdg-open https://10fastfingers.com/typing-test/english'
alias myip='curl ifconfig.me; echo'
alias ports='netstat -tulanp'
alias psmem='ps axch -o cmd,%mem --sort=-%mem | head'
alias pscpu='ps axch -o cmd,%cpu --sort=-%cpu | head'
alias ffmpeg='ffmpeg -hide_banner'

alias free='free -h'
alias ping='ping -c 7'
alias df='df -h'
alias bat='bat --theme OneHalfDark'
alias cat='bat --theme OneHalfDark -p'
alias copy='rsync --progress -auv'
#alias rm='trash'
alias pu='pushd'
alias po='popd'
alias iv='termimage'
alias mpc='mpd ; ncmpcpp'
alias wget="wget --hsts-file=/dev/null"
alias vim='nvim'
