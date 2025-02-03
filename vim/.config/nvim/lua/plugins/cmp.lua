local M = { "hrsh7th/nvim-cmp" }

M.dependencies = {
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

function M.config()
  local cmp = require("cmp")

  cmp.setup({
    enabled = true,

    completion = {
      autocomplete = false,
      completeopt = "menu,menuone",
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          path = "[PATH]",
          buffer = "[BUF]",
        })[entry.source.name]

        return vim_item
      end,
    },
    mapping = {
      -- ["<C-p>"] = cmp.mapping.select_prev_item(),
      -- ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-Space>"] = cmp.mapping.complete(),
      -- ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<C-g>"] = cmp.mapping(function(fallback)
        if cmp.visible_docs() then
          cmp.close_docs()
        elseif cmp.visible() then
          cmp.open_docs()
        else
          fallback()
        end
      end),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, {"i", "s"}),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, {"i", "s"}),
    },
    sources = {
      { name = "path" },
      { name = "nvim_lsp_signature_help" },
      { name = "nvim_lsp", keyword_length = 2  },
      { name = "buffer", keyword_length = 4  },
      { name = "nvim_lua" },
    },
    view = {
      docs = {
        auto_open = false,
      }
    },
    window = {
      completion = {
        border = "rounded",
        max_height = 15,
        max_width = 90,
        zindex = 50,
      },

      documentation = {
        border = "rounded",
        max_height = 15,
        max_width = 90,

        zindex = 50,
      }
    },
  })
end

return M
