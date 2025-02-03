local M = { "majutsushi/tagbar" }

vim.g.tagbar_autoclose = 1
vim.g.tagbar_autofocus = 0
vim.g.tagbar_sort = 0
vim.g.tagbar_type_python = {
  kinds = {
    'i:imports:1:0',
    'c:classes',
    'f:functions',
    'm:members',
    'v:variables:1:0'
  }
}

return M
