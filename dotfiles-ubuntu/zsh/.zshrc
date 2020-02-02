if [ $OSTYPE != "linux-android" ]; then
	source ~/.zprofile
fi
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
HISTSIZE=5000 #10000
SAVEHIST=5000 #10000
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
fi
