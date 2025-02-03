local M = { 'nvim-treesitter/nvim-treesitter' }

M.opts = {
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

function M.config(_, opts)
  require('nvim-treesitter.configs').setup(opts)

  vim.cmd([[
  autocmd FileType c,cpp,python,js set foldmethod=expr
  autocmd FileType c,cpp,python,js set foldexpr=nvim_treesitter#foldexpr()
  ]])
end

return M
