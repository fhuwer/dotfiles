let automake_blacklist = [ 'py', 'js', 'pl' ]
autocmd! BufWritePost * if index(automake_blacklist, &ft) < 0 | Neomake

nmap <Leader>m  :w<CR>:Neomake!<CR>
nmap <Leader>mc :w<CR>:NeomakeSh make clean<CR>

let g:neomake_python_pycodestyle_args = ['--ignore', 'E111, E114, E402, E501']
let g:neomake_python_flake8_args = ['--ignore', 'E111, E114, E501']
