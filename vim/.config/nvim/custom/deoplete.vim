let g:deoplete#enable_at_startup = 1

call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

" let g:deoplete#auto_complete_delay = 500
" call deoplete#custom#option("auto_complete_delay", 500)
call deoplete#custom#option({
  \ 'auto_complete': v:false,
\ })

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

inoremap <silent><expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" inoremap <expr><tab>  pumvisible() ? "\<C-n>" : "\<tab>"
" inoremap <expr><S-tab> pumvisible() ? "\<C-p>" : "\<bs>"

" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
