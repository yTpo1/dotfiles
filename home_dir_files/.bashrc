#
# ~/.bashrc
#

# If not running interactively, don't do anything (was in .bashrc by default)
[[ $- != *i* ]] && return

# (was in .bashrc by default)
alias ls='ls --color=auto'

# color variables
def_color="\e[0m"
green="\e[32;40m"
cyan_bg_grey="\e[36;40m"
cyan="\e[0;36m"

# was default
# PS1='[\u@\h \W]\$ '

# my PS1 config
PS1="$cyan\[\u~> $def_color\]"


# Information:
# \u - username
# \h - First part of hostname (such as "mybox")
# \H - Full hostname (such as "mybox.mydomain.com")
# \w - path to current directory

# colors: between "\e[" and "m". if needed more that one number, separate them with a semicolon.

# !Always close non-visible characters between "\[" and "\]",
# otherwise first line will be written over.!