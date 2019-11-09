# C development

## Tools:
* vim
* gcc
* gdb

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

Set breakpoint: **>break functionname**

If tui display is broken **>refresh**

watch a variable **>watch varname**

To quit: **>quit** or **>q**


