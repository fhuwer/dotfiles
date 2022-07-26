require("lsp_lines").setup()

vim.diagnostic.config({
  virtual_lines = true,
  virtual_text = false,
});

local function toggle_lsplines()
  if vim.diagnostic.config()["virtual_lines"] then
    vim.diagnostic.config({
      virtual_lines = false,
      virtual_text = { source = "always" },
    })
  else
    vim.diagnostic.config({
      virtual_lines = true,
      virtual_text = false,
    })
  end
end

vim.keymap.set(
  "",
  "<Leader>l",
  toggle_lsplines,
  { desc = "Toggle lsp_lines" }
)
