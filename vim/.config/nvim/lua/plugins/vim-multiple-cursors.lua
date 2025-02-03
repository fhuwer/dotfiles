local M = { "terryma/vim-multiple-cursors" }

vim.api.nvim_set_keymap("", "<C-d>", "", {})
vim.g.multi_cursor_use_default_mapping = 0
vim.g.multi_cursor_next_key = '<C-d>'
vim.g.multi_cursor_quit_key = '<Esc>'

return M
