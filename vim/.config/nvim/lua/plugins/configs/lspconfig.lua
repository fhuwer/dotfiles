require'lspconfig'.pylsp.setup{
  cmd = { vim.fn.expand("$HOME/.virtualenvs/neovim/bin/pylsp") }
}
