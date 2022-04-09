require("indent_blankline").setup {
  indent_blankline_char = "|",
  space_char_blankline = " ",
  use_treesitter = true,
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
  show_current_context = true,
  show_current_context_start = true,
  max_indent_increase = 2,
}

-- WORKAROUND: until fix of https://github.com/neovim/neovim/issues/14209
-- see also: https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"
