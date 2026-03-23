local M = { "neovim/nvim-lspconfig" }

M.dependencies = {
  "hrsh7th/cmp-nvim-lsp",
}

function M.config()
  vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
      local function opts(description)
        return { noremap=true, silent=true, desc=description, buffer=event.buf }
      end

      local lsp = vim.lsp.buf

      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts("Open floating diagnostics"))
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts("Jump to previous diagnostic"))
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts("Jump to next diagnostic"))
      vim.keymap.set("n", "<leader>b", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts("Format buffer"))

      vim.keymap.set('n', 'gD', lsp.declaration, opts("Goto declaration"))
      vim.keymap.set('n', 'gd', lsp.definition, opts("Goto definition"))
      vim.keymap.set('n', 'gh', lsp.signature_help, opts("Show signature help"))
      vim.keymap.set('n', 'gi', lsp.implementation, opts('List implementations (qf)'))
      vim.keymap.set('n', 'go', lsp.type_definition, opts('Goto type definition'))
      vim.keymap.set('n', 'gr', lsp.references, opts('List references (qf)'))
      vim.keymap.set('n', 'gs', lsp.signature_help, opts('Display signature help'))
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
      vim.keymap.set('n', '<leader>ca', lsp.code_action, opts('Show code actions'))
    end
  })

  vim.diagnostic.config({
    update_in_insert = true,
    underline = true,
    virtual_text = true,
  })

  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  vim.lsp.enable("ty")
  vim.lsp.config("ty", {
    capabilities = capabilities,
  })

  vim.lsp.enable("ruff")
  vim.lsp.config("ruff", {
    capabilities = capabilities,
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

  vim.lsp.enable("pylsp")
  vim.lsp.config("pylsp", {
    cmd = { vim.fn.expand("$HOME/.virtualenvs/neovim/bin/pylsp") },
    settings = {
      pylsp = {
        plugins = {
          pylint = { enabled = false },
          flake8 = { enabled = false },
          pycodestyle = { enabled = false },
          pyflakes = { enabled = false },
          rope = { enabled = true }
        }
      }
    }
  })

  vim.lsp.enable("tinymist")
  vim.lsp.config("tinymist", {
    capabilities = cmp_capabilities,
  })

  vim.lsp.enable("ccls")
  vim.lsp.config("ccls", {
    capabilities = cmp_capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp", "arduino" },
    init_options = {
      cache = {
        directory = "/tmp/ccls-cache";
      };
      -- compilationDatabaseDirectory = "build";
    }
  })
  

end

return M
