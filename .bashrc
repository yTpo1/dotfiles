#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1="\e[0;36m[\u@\h \W]\$ \e[m"
# PS1='[\u@\h \W]\$ '
