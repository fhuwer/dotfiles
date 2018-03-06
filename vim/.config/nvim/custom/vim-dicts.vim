command! -nargs=1 DictCC :call DictTranslate("cc", <q-args>)
command! -nargs=1 Thesaurus :call DictTranslate("thesaurus", <q-args>)

inoremap <F3> <Esc>:DictCur cc<CR>
nnoremap <F3> :DictCur cc<CR>

