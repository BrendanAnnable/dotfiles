# File colors
path=(/usr/local/opt/coreutils/libexec/gnubin $path)
[[ -r ~/.dir_colors ]] && eval "$(dircolors ~/.dir_colors)"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

setopt APPEND_HISTORY
unsetopt SHARE_HISTORY

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
alias 'ij'='idea'
alias stree='/Applications/SourceTree.app/Contents/Resources/stree'
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias par="parallel"
alias pp="prettyping"
alias cls="tput reset"
alias halp="git for-each-ref --count=30 --sort=-committerdate refs/heads --format='%(HEAD)%(color:yellow)%(refname:short)|%(color:bold green)%(committerdate:relative)|%(color:blue)%(subject)|%(color:magenta)%(authorname)%(color:reset)' |column -ts'|'"

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

base() {
  branch="${1:-master}"
  git merge-base HEAD "origin/${branch}"
}

alias sudo='sudo '

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Enable comments in shell
setopt interactivecomments

# Fix HEAD^ - See https://github.com/robbyrussell/oh-my-zsh/issues/449#issuecomment-6973326
setopt NO_NOMATCH

export PATH="$PATH:/Users/brendan/bin"

export EDITOR=nvim
alias vimdiff='nvim -d'

# https://github.com/junegunn/fzf
export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey -M vicmd v edit-command-line

eval "$(fasd --init auto)"

j() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}
