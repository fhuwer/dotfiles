M = { "folke/snacks.nvim" }

M.priority = 1000
M.lazy = false

M.opts = {
  bigfile = { enabled = true },
  indent = {
    enabled = true,
    animate = { enabled = false },
  },
  input = { enabled = false },
  picker = { enabled = false },
  notifier = { enabled = true },
  quickfile = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  words = { enabled = false },
}

return M
