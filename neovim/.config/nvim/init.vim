" vim:fdm=marker:foldlevel=0
" Settings -------------------------------------------------------------------
set encoding=utf-8
scriptencoding utf-8
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

" Python {{{
" If available use virtualenv for python
let s:virtualenv_python3 = glob(expand('$WORKON_HOME/neovim/bin/python'))
if !empty(s:virtualenv_python3)
   let g:python3_host_prog = s:virtualenv_python3
endif
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

" Source and edit init
command! SI :source ~/.config/nvim/init.vim
command! SE :tabedit ~/.config/nvim/init.vim

" Terminal {{{
function! VTerm()
   execute "vsplit"
   execute "terminal"
endfunction
function! Term()
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

" Spell check
nnoremap <F4> :set spell spelllang=en_gb<CR>

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

" Sidebars
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'

" Compiling, code completion/format + snippets
Plug 'neomake/neomake'
Plug 'godlygeek/tabular'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'raimondi/delimitmate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'romgrk/winteract.vim'
Plug 'weinshec/vim-dictcc'
Plug 'itchyny/lightline.vim'
Plug 'zhou13/vim-easyescape'
Plug 'altercation/vim-colors-solarized'

" Filetype plugins
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'vim-scripts/muttrc.vim'

call plug#end()

" Load settings
runtime custom/nerd.vim
runtime custom/tagbar.vim
runtime custom/neomake.vim
runtime custom/deoplete.vim
runtime custom/ultisnips.vim
runtime custom/gitgutter.vim
runtime custom/vim-multiple-cursors.vim
runtime custom/winteract.vim
runtime custom/vim-dictcc.vim
runtime custom/lightline.vim
runtime custom/easyescape.vim
runtime custom/vimtex.vim

colorscheme solarized
hi MatchParen cterm=none ctermbg=red ctermfg=white

" }}}
