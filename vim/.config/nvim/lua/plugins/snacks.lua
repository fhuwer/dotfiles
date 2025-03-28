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
  rename = { enabled = true },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  words = { enabled = false },
}

function M.config()
  vim.keymap.set("n", "<leader>r", "<cmd>lua Snacks.rename.rename_file()<CR>", { noremap=true, silent=true, desc="Rename file" })
end

return M
