#### zzz
After getting a char from stdin, the new line character '\n' might still be left in the input buffer.
In the example below, output will be blank, because '\n' left in the input buffer will make the input getline() be skipped:  
```
char *mess = NULL;
size_t len = 0;
int opt = getchar();
int n = getline(&mess, &len, stdin);
printf("%s", mess);
```
Solution:  
Adding a getchar() before the getline().

#### Char number '1' to int value 1.
If you assign:  
> int one = '1';   

Value of one will be equal to 49, because of the ASCII value.
To get the char value to be 1, the following will need to be done. Example:
```
char onec = '1';
int onei = onec - '0';
```
