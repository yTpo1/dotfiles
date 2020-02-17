#
# ~/.bash_profile
#

# don't know why I need this
# first checks if file exists and the executes the content of it
# [[ -f ~/.bashrc ]] && . ~/.bashrc

# Autostarts Xserver on login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

