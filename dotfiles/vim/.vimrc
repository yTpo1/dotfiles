" Vim-plug automated installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" To install plugins call :PlugInstall or reload file
call plug#begin('~/.vim/plugged')

" one of the dependencies needed breaks xorg in virtualbox
"Plug 'suan/vim-instant-markdown', {'for':'markdown'}
" Better file browser
"Plug 'scrooloose/nerdtree'
" Class/module browser
"Plug 'majutsushi/tagbar'
" Airline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" Python autocompletion, go to definition.
Plug 'davidhalter/jedi-vim'


call plug#end()

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on            

" tabs and spaces handling
" expand tabs into spaces
set expandtab
" set tabs to have 4 spaces
set tabstop=4
set softtabstop=4
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

" always show status bar
set ls=2

" enable syntax highlighting
syntax enable
" show line numbers
set number
" indent when moving to the next line while writing code
set autoindent
" show a visual line under the cursor's current line
set cursorline
" show the matching part of the pair for [] {} and ()
set showmatch
" enable all Python syntax highlighting features

" highlight all search matches
set hlsearch
" ignore case when searching
set ic
" show partial matches for a search phase
set is

let python_highlight_all = 1

" For quicker movements in insertion mode, map the following keys:
" https://vim.fandom.com/wiki/Quick_command_in_insert_mode
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
inoremap DD <Esc>dd
inoremap UU <Esc>u

let g:NERDTreeWinSize=15
let g:tagbar_width = 20

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" The unicode symbols section is unnecessary here if you already have a patched font but it gives you a nice fallback if you try to use other font which doesn't have the appropriate symbols.
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
