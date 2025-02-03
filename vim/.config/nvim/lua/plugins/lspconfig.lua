local M = { "neovim/nvim-lspconfig" }
local opts = { noremap=true, silent=true }

M.dependencies = {
  "hrsh7th/cmp-nvim-lsp",
}

local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

function M.config()
  local lspconfig = require('lspconfig')

  vim.diagnostic.config({
    update_in_insert = true,
    underline = true,
    virtual_text = true,
  })

  lspconfig.ruff.setup({
    on_attach = on_attach,
    capabilities = cmp_capabilities,
    cmd = { vim.fn.expand("$HOME/.virtualenvs/neovim/bin/ruff"), 'server' },
    init_options = {
      settings = {
        lineLength = 100,
        lint = {
          enable = true,
          preview = true,
          extendIgnore = {"E402", "E501", "W503", "E203", "D205", "D212"},
          extendSelect = {"E", "F", "W"},
        }
      }
    }
  })

  lspconfig.tinymist.setup{
    capabilities = cmp_capabilities,
  }
  lspconfig.ccls.setup {
    capabilities = cmp_capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp", "arduino" },
    init_options = {
      cache = {
        directory = "/tmp/ccls-cache";
      };
      -- compilationDatabaseDirectory = "build";
    }
  }
  

end

return M
