let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1

inoremap <expr><tab>  pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<C-p>" : "\<bs>"

autocmd InsertLeave * if pumvisible() == 0|pclose|endif
