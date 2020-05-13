set nocompatible " use vim defaults
"----------------------------------------------------------------
" 3. Vim internal settings
"----------------------------------------------------------------
"colorscheme gruvbox "desert ron nord OceanicNext iceberg

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on            

" auto write on each ":next", ":rewind", ":last", ":first", ":previous" etc..
set autowrite
" auto write on each ":edit", ":quit" etc..
" set autowriteall

" will change the 'completeopt' option so that Vim's popup menu doesn't select the first completion item, but rather just inserts the longest common text of all matches; and the menu will come up even if there's only one match.
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete " omnicompletion - vim standard module

set cursorline " Show a visual line under the cursor's current line
syntax enable  " Syntax highlighting
set showcmd    " Display entered commands at the bottom

set number relativenumber " show line numbers
set ruler      " show the current row and column
set autoindent "(set ai) indent when moving to the next line while writing code

filetype on        " detect type of file
"filetype indent on " load indent file for specific file type

" --SEARCH--
set showmatch  " show the matching part of the pair for [] {} and ()
set hlsearch   " highlight search matches
set incsearch  "(set is) show partial matches for a search phase
set ignorecase "(set ic) ignore case when searching
set smartcase  " no ignorecase if Uppercase char present

" make vsplit put the new buffer on the right of the current buffer:
"set splitright
" make split put the new buffer below the current buffer:
"set splitbelow

" exclude certain file extensions from completion
set wildignore+=*.pdf,*.o,*.out,*.obj,*.jpg,*.png
" to list them, but give low priority – list at end
" set suffixes+=.pdf
"https://vi.stackexchange.com/questions/2426/how-do-i-exclude-certain-file-extensions-from-completion

" --KEY REMAPS--
" The <Leader> key is mapped to \ by default.
" note: to see remaps ":map"

" Easy split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-H> <C-W><C-H>
" ZZ does :wq
nnoremap <Leader>x :wqall<Enter>

" Buffers
" For quicker buffer switching
" Important: space left after :b
nnoremap <Leader>z :b 

" vsplit <num>
nnoremap <Leader>j :vsplit 
nnoremap <Leader>k :belowright vsplit 
" vsplit buffer <num>
" Important: space left a the end
" will open a left vertical split
nnoremap <Leader>u :vert sb 
" open a split to the right
nnoremap <Leader>i :vert belowright sb 

			
" Open the .h file of the same name on the left
" https://stackoverflow.com/questions/17170902/in-vim-how-to-switch-quickly-between-h-and-cpp-files-with-the-same-name
nnoremap <Leader>h :40vsplit %:r.h<CR>
" Open the .c file of the same name on the right
nnoremap <Leader>c :belowright vsplit %:r.c<CR>

" For quicker movements in insertion mode, map the following keys:
" https://vim.fandom.com/wiki/Quick_command_in_insert_mode
inoremap II <Esc>I
inoremap AA <Esc>A

" search for visually selected text
" explanation: visually select the characters that are wanted in the search, then type //
" source: https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
