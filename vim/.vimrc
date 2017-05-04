" vim:fdm=marker:foldlevel=0
" Settings -------------------------------------------------------------------

" Necessary settings {{{
set nocompatible              " be iMproved, required
filetype off                  " required
" }}}

" Syntax and colorscheme {{{
set t_ut=
set background=dark
syntax on
" }}}

" Set leader key {{{
let mapleader = " "
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
if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif
" }}}

" Keybindings {{{

" Fast switching of windows
nnoremap <Leader>h <c-w>h
nnoremap <Leader>j <c-w>j
nnoremap <Leader>k <c-w>k
nnoremap <Leader>l <c-w>l

" Write file
nnoremap <Leader>s :update<CR>

" Fast sudo write
command SudoWrite execute ":w !sudo tee %<CR>"

" Paste toggle (,p)
set pastetoggle=<leader>p

" Use system clipboard
set clipboard=unnamedplus

" Use tab and shift+tab for indentation
vmap <Tab> >gv
vmap <S-Tab> <gv

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

" Filetypes ------------------------------------------------------------------

" Plugins {{{

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'

" VimTex
Plugin 'lervag/vimtex'

" Multi-Cursor (like sublime)
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-d>'

Plugin 'flazz/vim-colorschemes'

" Auto placing of brackets
Plugin 'raimondi/delimitmate'

" Nerdtree (Sidebar for files)
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
map <C-o> :NERDTreeToggle<CR>

" Nerdcommenter
Plugin 'scrooloose/nerdcommenter'

" YCM (code autocomplete)
let g:ycm_confirm_extra_conf=0
Plugin 'valloric/youcompleteme'

" Auto align code (:Tabularize /[CHARACTER])
Plugin 'godlygeek/tabular'

" Display ctags output in sidebar
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" fzf (check how to use)
Plugin 'junegunn/fzf'

" Preview hex colors
Plugin 'ap/vim-css-color'

" Fast window resizing
Plugin 'romgrk/winteract.vim'
nmap <leader>r :InteractiveWindow<CR>

" Vim Workspace -> Save workspace on end of session
Plugin 'thaerkh/vim-workspace'
nnoremap <leader>s :ToggleWorkspace<CR>

" Gitgutter
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_realtime=1
let g:gitgutter_map_keys=0
set updatetime=250
nnoremap <leader>gp :GitGutterPreviewHunk<CR>
nnoremap <leader>gu :GitGutterUndoHunk<CR>
nnoremap <leader>gs :GitGutterStageHunk<CR>

" Fugitive
Plugin 'tpope/vim-fugitive'

" Dict.cc lookup
Bundle 'weinshec/vim-dictcc'
inoremap <c-l> <Esc>:DictCur<CR>
nnoremap <c-l> :DictCur<CR>

" Airline
let g:airline_powerline_fonts = 1		" Needed for powerline fonts (special chars)
let g:airline_theme = 'solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

" EasyEscape
Plugin 'zhou13/vim-easyescape'
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>

call vundle#end()            " required
filetype plugin indent on    " required

colorscheme solarized

" }}}
