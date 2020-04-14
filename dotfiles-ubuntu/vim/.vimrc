set nocompatible " use vim defaults
"----------------------------------------------------------------
"  Index:
"   1. Plugins (Plug)
"   2. Plugins settings
"   3. Vim internal settings
"----------------------------------------------------------------
" 1. Plugins
"----------------------------------------------------------------
" Vim-plug automated installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
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
" Install the mini-server by running:
" > [sudo] npm -g install instant-markdown-d
Plug 'suan/vim-instant-markdown', {'for':'markdown'}

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

" NERD Commenter
Plug 'scrooloose/nerdcommenter'

Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" AutoCompletion
" :CocConfig to open the configuration file of coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Python autocompletion, go to definition.
Plug 'davidhalter/jedi-vim'
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
let NERDTreeIgnore=['.out', '\.pyc$', '\~$'] 

" The <Leader> key is mapped to \ by default.
" open toggle nerdtree
nnoremap <Leader>g :NERDTreeToggle<Enter>
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
" if hidden is not set, TextEdit might fail.
set hidden

" coc.nvim
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"----------------------------------------------------------------
" 3. Vim internal settings
"----------------------------------------------------------------
colorscheme gruvbox "desert ron nord OceanicNext iceberg

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

" --File Type/Languages--
" --MD,TXT--
:autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4

"" --PYTHON--
"au BufNewFile,BufRead *.py
"	\ set expandtab     " expand tabs into spaces
"	\ set tabstop=4     " set tabs to have 4 spaces
"	\ set softtabstop=4
"	\ set shiftwidth=4  " when using >> << commands, shift lines by 4 spaces
"
"" --HTML,CSS,JS--
"autocmd BufRead,BufNewFile *.js, *.html, *.css
"    \ setlocal expandtab     " expand tabs into spaces
"    \ setlocal tabstop=2
"    \ setlocal softtabstop=2
"    \ setlocal shiftwidth=2
" enable all Python syntax highlighting features
let python_highlight_all = 1
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
nnoremap <C-H> <C-W><C-H>
" ZZ does :wq
nnoremap <Leader>x :wqall<Enter>

" For quicker movements in insertion mode, map the following keys:
" https://vim.fandom.com/wiki/Quick_command_in_insert_mode
inoremap II <Esc>I
inoremap AA <Esc>A
"inoremap OO <Esc>O
"inoremap DD <Esc>dd
"inoremap UU <Esc>u
