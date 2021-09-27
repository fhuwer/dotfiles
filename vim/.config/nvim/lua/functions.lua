function StripWhitespace ()
  save_cursor = vim.fn.getcurpos()
  old_query = vim.fn.getreg("/")
  vim.api.nvim_command("%s/\\s\\+$//e")
  vim.fn.setpos(".", save_cursor)
  vim.fn.setreg("/", old_query)
end


-- Automatic retabbing
function Retab(before, after)
  vim.o.tabstop = before
  vim.o.expandtab = false
  vim.api.nvim_command('%retab!')
  vim.o.tabstop = after
  vim.o.expandtab = true
  vim.api.nvim_command('%retab!')
  -- execute '%retab!<CR>'
end
