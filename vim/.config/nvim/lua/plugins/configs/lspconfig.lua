local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

require'lspconfig'.pylsp.setup{
  on_attach = on_attach,
  cmd = { vim.fn.expand("$HOME/.virtualenvs/neovim/bin/pylsp") },
  settings = {
    pylsp = {
      plugins = {
        pylint = { enabled = false },
        flake8 = {
          enabled = true,
          maxLineLength = 100,
          ignore = "E402, E501, W503, E203",
        },
        pycodestyle = {
          enabled = true,
          maxLineLength = 100,
          ignore = "E402, E501, W503, E203",
        },
        pyflakes = { enabled = false }
      }
    }
  }
}
require('lspconfig').ccls.setup {
  filetypes = { "c", "cpp", "objc", "objcpp", "arduino" },
  init_options = {
    cache = {
      directory = "/tmp/ccls-cache";
    };
    -- compilationDatabaseDirectory = "build";
  }
}

if vim.fn.filereadable(vim.fn.expand("$HOME/.cargo/bin/openscad-language-server")) > 0 then
  require'lspconfig'.openscad_ls.setup{
    cmd = { vim.fn.expand("$HOME/.cargo/bin/openscad-language-server") }
  }
end
-- vim.diagnostic.config({
--   virtual_text = {
--     source = "always",  -- Or "if_many"
--   },
--   float = {
--     source = "always",  -- Or "if_many"
--   },
-- })
