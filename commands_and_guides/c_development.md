# C development

### Tools:
* vim
* gcc
* gdb

### GCC
To compile to something other than a.out use -o flag. Example:
> gcc test.c -o test

To use math.h library, compile with -lm flag. This is because library must be linked in. The math library is named libm.so and the -l command option assumes a lib prefix and library name **m** thus -lm. 
Example:  
> gcc test -lm




