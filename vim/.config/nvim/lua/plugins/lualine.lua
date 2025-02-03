local M = { "hoob3rt/lualine.nvim" }

M.dependencies = {
  "nvim-tree/nvim-web-devicons"
}

function M.config()
  require("lualine").setup()
end

return M
