#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# color variables
def_color="\e[0m"
green="\e[32;40m"
cyan_bg_grey="\e[36;40m"
cyan="\e[0;36m"

#PS1="$cyan\[\u~> $def_color\]"
PS1="\[\e[36m\]\u\[\e[m\]\[\e[36m\]\\$\[\e[m\] "

# import enviroment variables
source ~/.profile

# Information:
# \u - username
# \h - First part of hostname (such as "mybox")
# \H - Full hostname (such as "mybox.mydomain.com")
# \w - path to current directory

# colors: between "\e[" and "m". if needed more that one number, separate them with a semicolon.

# !Always close non-visible characters between "\[" and "\]",
# otherwise first line will be written over.!
