# Using vim as an IDE
Contents:
* Refactoring
* LSP Integration

## Refactoring
#### Change variable name
On variable **gd** or **gD** then  
**c** + **gn** + esc then **.**  
https://vi.stackexchange.com/questions/18004/renaming-variables  

#### Go to declaration of the variable  
Place cursor at name to rename and type  
**gd** (or **gD** if you're renaming a global variable).  

## LSP Integration (Language server protocol)
coc.nvim - https://github.com/neoclide/coc.nvim  
With vim-plug:  
```
" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
```
Copy and paste the vim configuration. And done. :D

cquery (c/c++ language server) - https://github.com/cquery-project/cquery
```
git clone --recursive https://github.com/cquery-project/cquery.git
cd cquery
git submodule update --init
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=release -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
cmake --build .
cmake --build . --target install
```
Add to coc.nvim configuration file:  
```
"languageserver": {
    "cquery": {
      "command": "cquery",
      "args": ["--log-file=/tmp/cq.log"],
      "filetypes": ["c", "cpp"],
      "rootPatterns": ["compile_flags.txt", "compile_commands.json", ".git/", ".hg/"],
      "initializationOptions": {
        "cacheDirectory": "/tmp/cquery"
      }
    }
  }
```

Python - Plug 'davidhalter/jedi-vim'
