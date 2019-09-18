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

#### Splitting viewport
https://www.linux.com/tutorials/vim-tips-using-viewports/  
**:sp** will split the Vim window horizontally. Can be written out entirely as **:split**
**:vsp** will split the Vim window vertically. Can be written out as **:vspliti**.
**:sp** filename
**Ctrl-w q** will close the active window.
**Ctrl-w n** - create new   
**Ctrl-w Ctrl-w** - moves between Vim viewports.   

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


## Nerdtree
https://code.tutsplus.com/tutorials/vim-essential-plugin-nerdtree--net-19692  
Start nerdtree  
> :NERDTree  

Open any file by typing o, or with the more convenient alias, the Enter key.  

#### Menu
Press the letter m to bring up a menu that will allow you to quickly add, move, copy, and delete nodes (or files). So, for example, if I want to create a new html file within a particular directory, I can type ma newfile.html.

## Tagbar
Start tagbar  
> :Tagbar
