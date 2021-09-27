vim.o.background= "dark"
vim.o.mouse = ""
vim.o.history = 1000
vim.o.laststatus = 2
vim.o.number = true
vim.o.showmode = false
vim.o.shortmess = "atI"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.textwidth = 99

-- Undo
vim.o.undofile = true
vim.o.backup = false
vim.o.writebackup = false

-- Indentation
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.softtabstop = vim.o.tabstop
vim.o.shiftwidth = vim.o.tabstop
vim.o.expandtab = true
vim.o.joinspaces = false

-- Search
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.wrapscan = true

-- Folding
vim.o.foldlevel=99

-- Use global clipboard
vim.o.clipboard="unnamedplus"

-- Leader
vim.g.mapleader = ";"

-- Python
virtualenv_python = vim.fn.glob(vim.fn.expand("$WORKON_HOME/neovim/bin/python"))
if virtualenv_python ~= "" then
  vim.g["python3_host_prog"] = virtualenv_python
end
