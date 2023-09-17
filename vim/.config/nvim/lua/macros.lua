vim.cmd(vim.api.nvim_replace_termcodes([[ let @t=':s#\%V.*\%V.#{% trans "&" %}<CR>:nohlsearch<CR>' ]], true, true, true))
