require("settings")
require("plugins")
require("functions")
require("keybindings")

vim.cmd("cabbr <expr> %% expand('%:p:h')")
