autocmd! BufWritePost * Neomake
nmap <Leader>m  :w<CR>:Neomake!<CR>
nmap <Leader>mc :w<CR>:NeomakeSh make clean<CR>

let g:neomake_python_pycodestyle_args = ['--ignore', 'E111, E114, E225, E231, E226, E402, E501, E731']
