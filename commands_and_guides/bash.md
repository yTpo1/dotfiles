## Moving the cursor
**Ctrl+a** or Home: Go to the beginning of the line.  
**Ctrl+e** or End: Go to the end of the line.  


Open terminal in the same directory as last terminal  
First terminal:  
> $ echo $PWD > ~/.last_dir  

Second terminal:  
> $ cd `cat ~/.last_dir`  

