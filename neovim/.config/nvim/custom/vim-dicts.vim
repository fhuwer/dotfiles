command! -nargs=1 DictCC :Dict cc <f-args>
command! -nargs=1 Thesaurus :Dict thesaurus <f-args>

inoremap <F3> <Esc>:DictCur cc<CR>
nnoremap <F3> :DictCur cc<CR>

