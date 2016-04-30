#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# File colors
path=("$(brew --prefix coreutils)"/libexec/gnubin $path)
[[ -r ~/.dir_colors ]] && eval "$(dircolors ~/.dir_colors)"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#
setopt APPEND_HISTORY

alias ls='ls --color'

# http://dougblack.io/words/zsh-vi-mode.html
bindkey -v

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1

alias '...'='cd ../../'
alias '....'='cd ../../../'
alias '.....'='cd ../../../../'
alias 'first'="sed '1q;d'"
alias 'second'="sed '2q;d'"
alias 'pb'='pbcopy'
alias 'cpf'='pfd | tr -d "\n" | pbcopy'
alias 'del'='rmtrash'

line() {
    sed "${1}q;d"
}

copy() {
    sed "${1}q;d" | pbcopy
}

ports() {
    if [ "$#" -eq 0 ]
    then
        lsof -i4 -n -P | grep LISTEN
    else
        lsof -i ":$1" -n -P
    fi
}

# AWS
source /usr/local/share/zsh/site-functions/_aws

alias sudo='sudo '
