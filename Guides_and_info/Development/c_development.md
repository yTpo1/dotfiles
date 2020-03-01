# C development

## Tools:
* gcc
* gdb
* vim
* ctags

## GCC
To compile to something other than a.out use -o flag. Example:
> gcc test.c -o test

To use math.h library, compile with -lm flag. This is because library must be linked in. The math library is named libm.so and the -l command option assumes a lib prefix and library name **m** thus -lm. 
Example:  
> gcc test -lm

## GDB

**-wall** flag  
**-g** - preserves the programs identifiers and symbols, so in debugging original variable and function names will be seen.
Example:
> gcc -std=c99 -Wall -g test.c -lm

Then:
> gdb a.out

#### Commands in gdb
Display code of the program: **>layout next**  

Run program:  **>run**  

Display variable: **>print varname**

Step to next line in the immediate scope: **>next** or **>n**
Step inside of a function: **>step**

Set breakpoint: **>break functionname** or **>b funcname**
Clear breakpoint: **>clear nameofbreak**  

If tui display is broken **>refresh**

watch a variable **>watch varname**

print an array print \*arrayname@10  (10 is size)

If segmentation fault: >**backtrace full** tells exactly what functions have been called and prints out in one command  
To print code listing >**list** (Very usefull after **backtrace**) 

To quit: **>quit** or **>q**

Tutorial:  
https://www.youtube.com/watch?v=bWH-nL7v5F4&list=PL6qqFPx9xQ1hLOoYAiQ-Me0xa2nlDTjys&index=21&t=726s  

#### ctags
Generate tags for current project **>ctags -R .**
