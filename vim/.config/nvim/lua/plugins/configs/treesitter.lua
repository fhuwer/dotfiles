require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "c", "cpp", "css", "html", "javascript", "json", "ledger",
    "lua", "python", "rst", "ruby", "rust", "toml", "yaml"
  },

  highlight = {
    enable = true
  },

  refactor = {
    highlight_definitions = {
      enable = true
    },
  },
}

vim.cmd([[
autocmd FileType c,cpp,python,js set foldmethod=expr
autocmd FileType c,cpp,python,js set foldexpr=nvim_treesitter#foldexpr()
]])
