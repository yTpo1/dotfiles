set nocompatible " use vim defaults

"----------------------------------------------------------------
"  Index:
"   1. Plugins (Plug)
"   2. Plugins settings
"   3. Vim internal settings

"----------------------------------------------------------------
" 1. Plugins (Plug)
"----------------------------------------------------------------
" Vim-plug automated installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List of plugins installed
" To install plugins ":so %" Then ":PlugInstall" To delete ":PlugClean"
call plug#begin('~/.vim/plugged')
" Colorscheme
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" To close buffers but not close current window structure
Plug 'qpkorr/vim-bufkill'

" Statusbar - Airline
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

"Fuzzy files, buffer etc
" <c-p> to invoke
"Plug 'kien/ctrlp.vim' " Project unmaintained
Plug 'ctrlpvim/ctrlp.vim'

" Automatic ctags generation
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

" Syntax check
" Usage: vims :lfirst :llast :lnext :lprevious
Plug 'scrooloose/syntastic'

" Python pep syntax check
Plug 'nvie/vim-flake8'

" Editing tools
" NERD Commenter
Plug 'scrooloose/nerdcommenter'

Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'

" AutoCompletion
" Python autocompletion, go to definition.
Plug 'davidhalter/jedi-vim'
" Autocompletion for C/C++
"Plug 'valloric/youcompleteme'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

call plug#end()

"----------------------------------------------------------------
" 2. Plugins settings
"----------------------------------------------------------------
" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" NERDTree
let g:NERDTreeWinSize=20
" autostart NERDTree
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] 

" The <Leader> key is mapped to \ by default.
" open toggle nerdtree
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <Leader>t :TagbarToggle<Enter>

" vim-nerdtree-syntax-highlight (Devicons + NerdTree)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

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
" Window height
:let g:syntastic_loc_list_height=3

" Theme
let g:airline_theme='jellybeans'
" Enable tabline
let g:airline#extensions#tabline#enabled = 1

"----------------------------------------------------------------
" 3. Vim internal settings
"----------------------------------------------------------------
"colorscheme desert
"colorscheme ron
colorscheme nord
"colorscheme OceanicNext
"colorscheme iceberg

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

" always show status bar
"set ls=2

set cursorline " Show a visual line under the cursor's current line
syntax enable  " Syntax highlighting
set cc=80      " Visual ruler, reminder to not write lines of code, too big in length
set showcmd    " Display entered commands at the bottom

set number     " show line numbers
set ruler      " show the current row and column
set autoindent "(set ai) indent when moving to the next line while writing code

"filetype on        " detect type of file
"filetype indent on " load indent file for specific file type

" --SEARCH--
set showmatch  " show the matching part of the pair for [] {} and ()
set hlsearch   " highlight search matches
set incsearch  "(set is) show partial matches for a search phase
set ignorecase "(set ic) ignore case when searching
set smartcase  " no ignorecase if Uppercase char present

" --File Type/Languages--
" --MD,TXT--
autocmd BufRead,BufNewFile *.md setlocal spell  " enable spell check
autocmd BufRead,BufNewFile *.txt setlocal spell " enable spell check

" --PYTHON--
" enable all Python syntax highlighting features
let python_highlight_all = 1
au BufNewFile,BufRead *.py
	\ set expandtab     " expand tabs into spaces
	\ set tabstop=4     " set tabs to have 4 spaces
	\ set softtabstop=4
	\ set shiftwidth=4  " when using >> << commands, shift lines by 4 spaces

" --HTML,CSS,JS--
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
" tab length exceptions on some file types
"autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
"autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
"autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

" --KEY REMAPS--
" Easy split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" For quicker movements in insertion mode, map the following keys:
" https://vim.fandom.com/wiki/Quick_command_in_insert_mode
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
""inoremap DD <Esc>dd
"inoremap UU <Esc>u
