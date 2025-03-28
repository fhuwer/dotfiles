local M = { "neovim/nvim-lspconfig" }
local function opts(description, buffer)
  return { noremap=true, silent=true, desc=description, buffer=buffer }
end

M.dependencies = {
  "hrsh7th/cmp-nvim-lsp",
}

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts("Open floating diagnostics"))
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts("Jump to previous diagnostic"))
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts("Jump to next diagnostic"))
vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts("Open diagnostic buffer"))
vim.keymap.set("n", "<leader>b", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts("Format buffer"))

local on_attach = function(client, bufnr)
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts("Goto declaration", bufnr))
  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts("Goto definition", bufnr))
  vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts("Show signature help", bufnr))
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol", bufnr))
end

function M.config()
  local lspconfig = require("lspconfig")

  vim.diagnostic.config({
    update_in_insert = true,
    underline = true,
    virtual_text = true,
  })

  lspconfig.pylsp.setup{
    on_attach = on_attach,
    cmd = { vim.fn.expand("$HOME/.virtualenvs/neovim/bin/pylsp") },
    settings = {
      pylsp = {
        plugins = {
          pylint = { enabled = false },
          flake8 = { enabled = false },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          pycodestyle = { enabled = false },
          pyflakes = { enabled = false },
          rope = { enabled = true }
        }
      }
    }
  }
  lspconfig.ruff.setup({
    on_attach = on_attach,
    capabilities = cmp_capabilities,
    cmd = { vim.fn.expand("$HOME/.virtualenvs/neovim/bin/ruff"), "server" },
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
    on_attach = on_attach,
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
