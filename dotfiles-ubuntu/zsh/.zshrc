# .zprofile is being sourced automatically
source ~/.zalias
# Enable colors and change prompt:
autoload -U colors && colors

# allow command substitution inside the prompt
setopt prompt_subst 
#PROMPT='%F{cyan}%~%F{green}$(git_branch)%f '     # set the prompt value
PROMPT='%F{cyan}%~%F{green}$%f '     # set the prompt value

# History in cache directory
#HISTFILE=~/.cache/zsh/.zsh_history
HISTFILE=~/.zsh_history
HISTSIZE=10000 #5000
SAVEHIST=10000 #5000
setopt appendhistory

# Auto(tab) command completetion
# "-U" prevents the expansion of aliases
# "-z" means use zsh (rather than ksh) style
autoload -Uz compinit
# For autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Use beam shape cursor on startup.
echo -ne '\e[5 q' 

# vi mode
bindkey -v
# Eliminate delays on ESC
export KEYTIMEOUT=1

#source .zfunctions

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# cd without typing cd
setopt autocd

# Ignore certain file types when autocompletion
# https://www.reddit.com/r/zsh/comments/5ghouo/is_there_a_way_to_have_zsh_ignore_certain_file/
# ignore certain extensions only for certain programs
zstyle ':completion:*:*:nvim:*' file-patterns '^*.(o|out|pdf):source-files' '*:all-files'

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

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

if [ $OSTYPE != "linux-android" ]; then
	# load antibody plugins
	source ~/.zsh_plugins.sh
	source ~/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-djui-SLASH-alias-tips/alias-tips.plugin.zsh 
	source ~/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
	# Autosuggestion - use ctrl+space to accect autosuggestion
	bindkey '^ ' autosuggest-accept
	## start tmux session
	#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	#    tmux attach -t default || tmux new -s default
	#fi

fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
