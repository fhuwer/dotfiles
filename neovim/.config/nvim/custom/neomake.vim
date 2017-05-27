autocmd! BufWritePost * Neomake
nmap <Leader>m  :w<CR>:Neomake!<CR>
nmap <Leader>mc :w<CR>:NeomakeSh make clean<CR>
