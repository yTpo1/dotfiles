source ~/.zprofile
source ~/.zalias
# Enable colors and change prompt:
autoload -U colors && colors

setopt prompt_subst             # allow command substitution inside the prompt
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


# Use vim keys in tab complete menu instead of arrows
# (Downside: can't use these keys to type characters while menuselecting)
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
