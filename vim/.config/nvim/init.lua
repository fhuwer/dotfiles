require("settings")
require("plugins")
require("functions")
require("keybindings")
require("macros")

vim.cmd("cabbr <expr> %% expand('%:p:h')")

-- Set virtual_text only if lsp-lines is not active
if vim.diagnostic.config()["virtual_lines"] == false then
  vim.diagnostic.config({
    virtual_text = {
      source = "always",  -- Or "if_many"
    },
    float = {
      source = "always",  -- Or "if_many"
    },
  })
end
