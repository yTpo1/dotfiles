To learn basics of vim use: vimtutor

## Plugins
Plug in manager: https://github.com/junegunn/vim-plug  

Markdown: https://github.com/suan/vim-instant-markdown  


## Hotkeys
Duplicate line  
> YP  

https://medium.com/usevim/vim-101-quick-movement-c12889e759e0  
Guide to remember (Ctrl+_): **u**p **d**own **f**orward **b**ack **H**ome **M**iddle **L**ast  

Go to Top/Middle/Bottom of the screen  
> H, M, L  

Move screep Up/Down with one line  
> Ctrl+y , Ctrl+e  

Moves cursor & screen Up/Down half a page  
> Ctrl+u , Ctrl+d 

#### Insertion mode
CTRL-n and CTRL-p (:help CTRL-N) will invoke Vim's auto completion, displaying a menu of matches.

#### Quick movements
<Esc>I - go to just before the first non-blank text of the line  
<Esc>A - go to the end of the line 
<Esc>O - start editing on a new line above the current line 



## Commands
Detect file type  
> :filetype detect  

Save file opened without sudo access, but requiring it  
> :w !sudo tee %  

**tee** – The output of write (vim :w) command redirected using tee.  
**%** - Is the current file name  

Source / Execute command or file. https://stackoverflow.com/questions/803464/how-do-i-source-something-in-my-vimrc-file
> :source  
> :so 
> :so %

