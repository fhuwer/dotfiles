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

-- Switching between header and source files
local code_switcher_headers = {"h", "hh"}
local code_switcher_source = {"c", "cc", "cxx", "cpp"}

local function contains(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end

function switch_header_source()
  local folder = vim.fn.expand("%:p:h")
  local parentfolder = vim.fn.expand("%:p:h:h")
  local filename = vim.fn.expand("%:t:r")
  local extension = vim.fn.expand("%:e")
  if contains(code_switcher_headers, extension) then
    for _, ext in pairs(code_switcher_source) do
      local otherfile = vim.api.nvim_eval(string.format('globpath("%s", "**/%s.%s")', parentfolder, filename, ext))
      if vim.api.nvim_eval(string.format('filereadable("%s")', otherfile)) ~= 0 then
        vim.api.nvim_exec(string.format("edit %s", otherfile), true)
        return
      end
    end
  elseif contains(code_switcher_source, extension) then
    for _, ext in pairs(code_switcher_headers) do
      local otherfile = vim.api.nvim_eval(string.format('globpath("%s", "**/%s.%s")', parentfolder, filename, ext))
      if vim.api.nvim_eval(string.format('filereadable("%s")', otherfile)) ~= 0 then
        vim.api.nvim_exec(string.format("edit %s", otherfile), true)
        return
      end
    end
  end
end
vim.keymap.set("n", "<F11>", switch_header_source)
