#
# ~/.bash_profile
#

# have no idea what this does
# [[ -f ~/.bashrc ]] && . ~/.bashrc

# Autostarts Xserver on login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
