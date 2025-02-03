local M = { "christoomey/vim-tmux-navigator" }

vim.g.tmux_navigator_no_mappings = 1

vim.api.nvim_set_keymap("n", "<A-h>", ":TmuxNavigateLeft<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-j>", ":TmuxNavigateDown<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":TmuxNavigateUp<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-l>", ":TmuxNavigateRight<cr>", { noremap = true, silent = true })

return M
