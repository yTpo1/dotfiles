# The incantation typeset -U PATH path, where the -U stands for unique, tells the shell that it should not append anything to $PATH and $path if it is there already
typeset -U PATH path
path=("$HOME/.local/bin" /other/things/in/path "$path[@]")
export PATH
