local map = vim.api.nvim_set_keymap
options = { noremap = true }

-- Disable function keys + some others in insert mode
map("i", "<F1>", "", options)
map("i", "<F2>", "", options)
map("i", "<F3>", "", options)
map("i", "<F4>", "", options)
map("i", "<F5>", "", options)
map("i", "<F6>", "", options)
map("i", "<F7>", "", options)
map("i", "<F8>", "", options)
map("i", "<F9>", "", options)
map("i", "<F10>", "", options)
map("i", "<F11>", "", options)
map("i", "<F12>", "", options)
map("i", "<S-Del>", "", options)

-- Allow movement in insert mode with ALT
map("i", "<A-h>", "<Left>", options)
map("i", "<A-j>", "<Down>", options)
map("i", "<A-k>", "<Up>", options)
map("i", "<A-l>", "<Right>", options)

-- Fast moving of windows
map("n", "<leader><C-H>", "<c-w>H", options)
map("n", "<leader><C-J>", "<c-w>J", options)
map("n", "<leader><C-K>", "<c-w>K", options)
map("n", "<leader><C-L>", "<c-w>L", options)

-- Write file
map("n", "<leader>w", ":update<cr>", options)

-- Run black on the file
map("n", "<leader>b", ":Black<cr>", options)

-- Hide search highlight
map("n", "<leader>n", ":nohlsearch<cr>", options)

-- Tab and shift+tab for indentation
map("v", "<Tab>", ">gv", {noremap = false})
map("v", "<S-Tab>", "<gv", {noremap = false})

map("n", "<F4>", [[<Cmd>lua if vim.o.spell == true then print("Spell check disabled"); vim.o.spell = false; else print("Spell check enabled"); vim.o.spell=true; vim.o.spelllang="en_gb"; end<CR>]], options)
