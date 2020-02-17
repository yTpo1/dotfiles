# ST terminal
## Hotkeys
https://github.com/jschaf/suckless-terminal/blob/master/st.1  
Ctrl-Shift-y  
Paste from primary selection (middle mouse button).  

Ctrl-Shift-v  
Paste from the clipboard selection.  

Ctrl-Shift-c  
Copy the selected text to the clipboard selection.  

## Installation
> git clone https://git.suckless.org/st
> git checkout 0.8.2
> sudo make clean install

## Patching - doesnt work coz i suck
1. Put the .diff file in the git repo.  
2. Use `patch` command
-i : read patch from file
--merge : just like resolving git merge conflict
> patch --merge -i filename
