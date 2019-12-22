source .zprofile
# Enable colors and change prompt:
autoload -U colors && colors

# function to return current branch name while suppressing errors.
function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo ' (' $branch ') '
    fi
}

setopt prompt_subst             # allow command substitution inside the prompt
PROMPT='%F{cyan}%~%F{green}$(git_branch)%f '     # set the prompt value

# my PS1
#PROMPT="%F{cyan}%n%f%F{cyan}$%f "
#PROMPT="{cyan}%{cyan}~$ "
#PROMPT="%F{cyan}%~$%f "

# History in cache directory
#HISTFILE=~/.cache/zsh/.zsh_history
HISTFILE=~/.zsh_history
HISTSIZE=5000 #10000
SAVEHIST=5000 #10000
setopt appendhistory

# Auto/tab complete
#autoload -Uz compinit
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.
#zstyle :compinstall filename '/home/ghost1/.zshrc'

# =============================================================================
# Aliases

# make ls output colorfull (example: folders and files different colors)
alias ls='ls --color=auto' 

#alias v='/home/ghost/Downloads/neovim/build/bin/nvim'



# vi mode
bindkey -v
export KEYTIMEOUT=1

# cd without typing cd :D
setopt autocd

# Use vim keys in tab complete menu instead of arrows
# (Downside: can't use these keys to type characters while menuselecting)
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# export environment variables
#source ~/.zshenv

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
