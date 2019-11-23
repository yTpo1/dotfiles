"----------------------------------------------------------------
"  Index:
"   1. Plugins (Plug)
"   2. Plugins settings
"   3. User interface
"   4. Other
"----------------------------------------------------------------

"----------------------------------------------------------------
" 1. Plugins (Plug)
"----------------------------------------------------------------
" Guide: To install 
" :so % 
" :PlugInstall
" To delete
" :PlugClean

" Vim-plug automated installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List of plugins installed
" To install plugins call :PlugInstall or reload file
call plug#begin('~/.vim/plugged')
" Colorscheme
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'

" Statusbar
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Markdown editor live viewer browser
" one of the dependencies needed breaks xorg in virtualbox
"Plug 'suan/vim-instant-markdown', {'for':'markdown'}

" Tools
" File browser
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Class/module browser
Plug 'majutsushi/tagbar'

" Syntax check
Plug 'scrooloose/syntastic'

" Editing tools
" NERD Commenter
Plug 'scrooloose/nerdcommenter'

" Python autocompletion, go to definition.
"Plug 'davidhalter/jedi-vim'
" Autocompletion for C/C++
"Plug 'valloric/youcompleteme'

call plug#end()

"----------------------------------------------------------------
" 2. Plugins settings
"----------------------------------------------------------------
" NERDTree
let g:NERDTreeWinSize=15
" autostart NERDTree
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Tagbar
let g:tagbar_width = 20
" Width of the Tagbar window when zoomed.
" 0: Use the width of the longest currently visible tag.
let g:tagbar_zoomwidth = 0
" The number of spaces by which each level is indented. This allows making the display more compact or more spacious.
let g:tagbar_indent = 1
" Show the visibility symbols (public/protected/private) to the left of the tag name. Default: 1.
let g:tagbar_show_visibility = 0

" vim air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" syntastic
" rethink these settings after reading the manual
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" By default syntastic doesn't fill the |location-list| with the errors found by the checkers, in order to reduce clashes with other plugins. Enable this option to tell syntastic to always stick any detected errors into the |location-list|:
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" If this variable is enabled, syntastic in active mode will run syntax checks when buffers are first loaded, as well as on saving:
let g:syntastic_check_on_open = 1
" In active mode syntax checks are normally run whenever buffers are written to disk, even when the writes happen just before quitting Vim. If you want to skip checks when you issue `:wq`, `:x`, and `:ZZ`, set this variable to 0:
let g:syntastic_check_on_wq = 0


" theme
let g:airline_theme='jellybeans'
" enable tabline
let g:airline#extensions#tabline#enabled = 1

if $TERM=='rxvt-unicode-256color'
    " unicode symbols
    " The unicode symbols section is unnecessary here if you already have a patched font but it gives you a nice fallback if you try to use other font which doesn't have the appropriate symbols.
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = 'cry'
    let g:airline_symbols.linenr = '='
    let g:airline_symbols.linenr = 'LF'
    let g:airline_symbols.linenr = 'NL'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'
    
    " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
end

if $TERM=='xterm-256color'
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '>'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '<'
    let g:airline_symbols.crypt = 'cry'
    let g:airline_symbols.linenr = '='
    let g:airline_symbols.linenr = 'LF'
    let g:airline_symbols.linenr = 'NL'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = 'ln'
    let g:airline_symbols.branch = 'br'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '||'
    let g:airline_symbols.spell = 'Sp'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'
    
    " airline symbols
    let g:airline_left_sep = '>>'
    let g:airline_left_alt_sep = '>'
    let g:airline_right_sep = '<<'
    let g:airline_right_alt_sep = '<'
    let g:airline_symbols.branch = 'Br'
    let g:airline_symbols.readonly = 'readonly'
    let g:airline_symbols.linenr = '='
end

"----------------------------------------------------------------
" 3. User interface
"----------------------------------------------------------------

" show a visual line under the cursor's current line
set cursorline

" syntax highlighting
syntax enable

"colorscheme desert
"colorscheme ron
"colorscheme nord
" Windows set up
colorscheme OceanicNext

"----------------------------------------------------------------
" 4. Other
"----------------------------------------------------------------

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on            

" enable spell check if filetype .md .txt
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell

" auto write on each ":next", ":rewind", ":last", ":first", ":previous" etc..
set autowrite
" auto write on each ":edit", ":quit" etc..
" set autowriteall

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
"set ls=2

" show line numbers
set number
" indent when moving to the next line while writing code
set autoindent
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
""inoremap DD <Esc>dd
"inoremap UU <Esc>u

" The <Leader> key is mapped to \ by default.
" open toggle nerdtree
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <Leader>t :TagbarToggle<Enter>
