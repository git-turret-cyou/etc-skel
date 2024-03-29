#!/bin/bash

[[ $- == *i* ]] && stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
set -o vi
export EDITOR='vi'
export VISUAL='vi'
export GPG_TTY=$(tty)
HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#export PS1="\[\e[31m\][\[$(tput bold)\]\[\e[m\]\[\e[31m\]!\[\e[m\]\[\e[31m\]\u!\[\e[m\]\[\e[31m\]@\[\e[m\]\[\e[31m\]\h\[\e[m\] \[\e[34m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\[\e[31m\]#\[\e[m\] "

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
#eval $(dircolors -b $HOME/.dircolors)
alias ls='ls --color'
alias xclip='xclip -selection clipboard'
#LS_COLORS='di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=94:*.doc=104:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.xlsm=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106'
export LS_COLORS
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin

export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

[[ $(tty) == "/dev/tty1" ]] && startx && exit
