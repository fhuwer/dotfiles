-- vim.g['grammarous#disabled_rules'] = {
--   ["*"] = { 'ARROWS', 'CURRENCY', 'UNIT_SPACE', 'COMMA_PARENTHESIS_WHITESPACE', 'UNLIKELY_OPENING_PUNCTUATION', 'WHITESPACE_RULE' }
-- }
vim.g['grammarous#mother_lang'] = 'de-DE'

vim.cmd([[
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
  nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
  nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
  nmap <buffer><C-f> <Plug>(grammarous-fixit)
  nmap <buffer><C-i> <Plug>(grammarous-remove-error) <Plug>(grammarous-move-to-next-error)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
  nunmap <buffer><C-n>
  nunmap <buffer><C-p>
  nunmap <buffer><C-f>
  nunmap <buffer><C-i>
endfunction
]])
