# .zprofile is being sourced automatically
source ~/.zalias
source ~/.zfunctions
source ~/.zsensitive

# Enable colors and change prompt:
autoload -U colors && colors

# allow command substitution inside the prompt
setopt prompt_subst 
# PROMPT='~' #is set in zfunctions under git

# History in cache directory
#HISTFILE=~/.cache/zsh/.zsh_history
HISTFILE=~/.zsh_history
HISTSIZE=15000
SAVEHIST=15000
setopt appendhistory

# ----------------------------------
# Completion
# Auto(tab) command completetion
# "-U" prevents the expansion of aliases
# "-z" means use zsh (rather than ksh) style
autoload -Uz compinit
# For autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Ignore certain file types when autocompletion
# https://www.reddit.com/r/zsh/comments/5ghouo/is_there_a_way_to_have_zsh_ignore_certain_file/
# ignore certain extensions only for certain programs
zstyle ':completion:*:*:nvim:*' file-patterns '^*.(o|out|pdf):source-files' '*:all-files'

# Use beam shape cursor on startup.
#echo -ne '\e[5 q' 

# -------------------------------------
# vi mode
bindkey -v
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Eliminate delays on ESC
export KEYTIMEOUT=1

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# cd without typing cd
setopt autocd


if [ $OSTYPE != "linux-android" ]; then
	# load antibody plugins
	source ~/.zsh_plugins.sh
	#source ~/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-djui-SLASH-alias-tips/alias-tips.plugin.zsh 
	#source ~/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
	# Autosuggestion - use ctrl+space to accect autosuggestion
	bindkey '^ ' autosuggest-accept
	## start tmux session
	#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	#    tmux attach -t default || tmux new -s default
	#fi
	
	# default is screen, so colors will be shit
	#if [ ! "$TMUX" = "" ]; then export TERM=xterm-256color; fi

fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
