export XDG_CONFIG_HOME="$HOME/.config"
export BROWSER=/usr/bin/firefox
if [ command -v nvim &> /dev/null ]; then
	export VISUAL='nvim'
	export EDITOR='nvim'
else
	export VISUAL='vim'
	export EDITOR='vim'
fi
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# Colorful manpages
# Color codes: 31 - red. 32 - green. 33 - yellow. 
# Escape codes: 0 - reset/normal. 1 - bold. 4 - underlined
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# The incantation typeset -U PATH path, where the -U stands for unique, tells the shell that it should not append anything to $PATH and $path if it is there already
typeset -U PATH path
path=("$HOME/.local/bin" /other/things/in/path "$path[@]")
export PATH
