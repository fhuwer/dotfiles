M = { "folke/which-key.nvim" }

M.event = "VeryLazy"
M.opts = {
  delay = 500
}
M.keys = {
  {
    "<leader>?",
    function()
      require("which-key").show({ global = false })
    end,
    desc="Buffer Local Keymaps (which-key)",
  }
}

return M
