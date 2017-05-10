" vim:fdm=marker:foldlevel=0
" Settings -------------------------------------------------------------------

" Syntax and colorscheme {{{
set t_ut=
set background=dark
syntax on
" }}}

" Set leader key {{{
let mapleader = ";"
" }}}

" Local directories and functions {{{
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Activate persistent undo
set undofile
" }}}

" Indentation {{{
set autoindent
set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab
" }}}

" Folding {{{
let foldlevel_all_open=20           " Level used as 'open all' level
set foldenable                      " Enable folding
set foldcolumn=0                    " Column to show folds
let &foldlevel=foldlevel_all_open   " Close all folds by default
set foldmethod=syntax               " Syntax are used to specify folds

nnoremap <leader>fac :set foldlevel=0<CR>
nnoremap <leader>fao :let &foldlevel=foldlevel_all_open<CR>
" }}}

" Search {{{
set hlsearch                  " Highlight search
set ignorecase                " Ignore case in search
set smartcase                 " Ignore 'ignorecase' if search pattern contains uppercase
set incsearch                 " Highlight dinamically as pattern is typed
set wrapscan                  " Wrap search around end of file
" }}}

" General settings {{{
set mouse=                    " Disable mouse
set encoding=utf-8 nobomb     " UTF-8 without BOM
set history=1000              " Increase history from 20 to 1000
set laststatus=2              " Always show airline (even with only one window)
set number                    " Show line numbers
set noerrorbells              " Disable error bell
set visualbell                " Use visual bell instead
set noshowmode                " Hide mode as airline does this already
set shortmess=atI             " Don't show the intro message when starting vim
set splitright                " New window on the right (not on the left)
set splitbelow                " New window below active (not above)
" }}}

" Configuration --------------------------------------------------------------

" FastEscape {{{
" Speed up transition from modes
"if ! has('gui_running')
   "set ttimeoutlen=10
   "augroup FastEscape
      "autocmd!
      "au InsertEnter * set timeoutlen=0
      "au InsertLeave * set timeoutlen=1000
   "augroup END
"endif
" }}}

" Custom commands {{{

" Terminal {{{
function VTerm()
   execute "vsplit"
   execute "terminal"
endfunction
function Term()
   execute "split"
   execute "terminal"
endfunction
command! T call Term() 
command! VT call VTerm() 
" }}}

" }}}

" Keybindings {{{

" Fast switching of windows
nnoremap <S-h> <c-w>h
nnoremap <S-j> <c-w>j
nnoremap <S-k> <c-w>k
nnoremap <S-l> <c-w>l

" Fast moving of windows
nnoremap <C-H> <c-w>H
nnoremap <C-J> <c-w>J
nnoremap <C-K> <c-w>K
nnoremap <C-L> <c-w>L

" Write file
nnoremap <S-w> :update<CR>

" Fast sudo write
command! SudoWrite execute ":w !sudo tee %<CR>"

" Paste toggle (,p)
set pastetoggle=<leader>p

" Use system clipboard
set clipboard=unnamedplus

" Use tab and shift+tab for indentation
vmap <Tab> >gv
vmap <S-Tab> <gv

" Follow file in new window
nnoremap <Leader>gg :vertical wincmd f<CR>

" Clear search
nnoremap <Leader>n :noh<CR>

" GoTo next quickfix in file
nnoremap <S-F> :cnf<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap HH <c-\><c-n><c-w>h
tnoremap JJ <c-\><c-n><c-w>j
tnoremap KK <c-\><c-n><c-w>k
tnoremap LL <c-\><c-n><c-w>l
nnoremap <F2> :T<CR>
nnoremap <S-F2> :VT<CR>

" Strip trailing whitespace (,ss) {{{
function! StripWhitespace () " {{{
   let save_cursor = getpos(".")
   let old_query = getreg('/')
   :%s/\s\+$//e
   call setpos('.', save_cursor)
   call setreg('/', old_query)
endfunction " }}}
" noremap <leader>ss :call StripWhitespace ()<CR>
" }}}

" }}}

" Plugins {{{

" set the runtime path to include vim-plug and initialize
call plug#begin('~/.config/nvim/plugged')

" VimTex
Plug 'lervag/vimtex'
let g:vimtex_view_method = 'zathura'

" Multi-Cursor (like sublime)
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-d>'

Plug 'flazz/vim-colorschemes'

" Auto placing of brackets
Plug 'raimondi/delimitmate'

" Nerdtree (Sidebar for files)
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
map <F8> :NERDTreeToggle<CR>

" Nerdcommenter
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" YCM (code autocomplete)
let g:ycm_confirm_extra_conf=0
Plug 'valloric/youcompleteme'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Syntax checks
Plug 'neomake/neomake'
let g:neomake_arduino_arduinomk_maker = {
   \ 'exe': 'make',
   \ 'args': [],
   \ 'errorformat': '|| %f|%l col %c %s| %m' 
\ }

" Auto align code (:Tabularize /[CHARACTER])
Plug 'godlygeek/tabular'

" Display ctags output in sidebar
Plug 'majutsushi/tagbar'
nmap <S-F8> :TagbarToggle<CR>

" fzf (check how to use)
Plug 'junegunn/fzf'

" Preview hex colors
Plug 'ap/vim-css-color'

" Fast window resizing
Plug 'romgrk/winteract.vim'
nmap <leader>r :InteractiveWindow<CR>

" Gitgutter
Plug 'airblade/vim-gitgutter'
let g:gitgutter_realtime=1
let g:gitgutter_map_keys=0
set updatetime=250
nnoremap <leader>gp :GitGutterPreviewHunk<CR>
nnoremap <leader>gu :GitGutterUndoHunk<CR>
nnoremap <leader>gs :GitGutterStageHunk<CR>

" Fugitive
Plug 'tpope/vim-fugitive'

" Dict.cc lookup
Plug 'weinshec/vim-dictcc'
inoremap <F3> <Esc>:DictCur<CR>
nnoremap <F3> :DictCur<CR>

" Airline
let g:airline_powerline_fonts = 1		" Needed for powerline fonts (special chars)
let g:airline_theme = 'solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Solarized color scheme
Plug 'altercation/vim-colors-solarized'

" EasyEscape
Plug 'zhou13/vim-easyescape'
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>

call plug#end()            " required

colorscheme solarized

" }}}
