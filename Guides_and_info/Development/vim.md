To learn basics of vim use: vimtutor

## Normal Mode Hotkeys 

Redraw screen: **Ctrl+l**

Line forward/backward **)** **(**
Paragraph forward/backward **}** **{**
Go to next/previous start of method **]m** **[m**
Go to next/previous end of method **]M** **[M**

Append text at the end of the line: **A**  

Duplicate line: **YP**  

Guide to remember **Ctrl+\_** - **u**p **d**own **f**orward **b**ack **H**ome **M**iddle **L**ast  
https://medium.com/usevim/vim-101-quick-movement-c12889e759e0  

Go to Top/Middle/Bottom of the screen: **H** **M** **L**  

Move screen Up/Down with one line: **Ctrl+y** **Ctrl+e**  

Moves cursor & screen Up/Down half a page **Ctrl+u** **Ctrl+d** 

#### Insertion mode
Auto-completion
**ctrl-n** and **ctrl-p** (:help CTRL-N) will invoke Vim's auto completion, displaying a menu of matches.

**ctrl-x ctrl-n** auto-complete just for this file.
**ctrl-x ctrl-f** for filenames
**ctrl-x ctrl-]** for tags only (need tags file)

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

Open shell
> :!sh  

:! launches an external process -- in this case sh, another shell. Control will return to vim once you exit the shell. If you want to use the shell concurrently with vim, add & to the end of the sh command:  
> :!sh&

## Plugins
Plug in manager: https://github.com/junegunn/vim-plug  

Markdown: https://github.com/suan/vim-instant-markdown  

## Nerdtree
https://code.tutsplus.com/tutorials/vim-essential-plugin-nerdtree--net-19692  
Installed with pacman.  
Start nerdtree  
> :NERDTree  

Open any file by typing o, or with the more convenient alias, the Enter key.  

#### Menu
Press the letter m to bring up a menu that will allow you to quickly add, move, copy, and delete nodes (or files). So, for example, if I want to create a new html file within a particular directory, I can type ma newfile.html.

## Tagbar
Installed with pacman.  
Start tagbar  
> :Tagbar

## Vim-airline
Installed with pacman.  
