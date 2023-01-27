require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "c", "cpp", "css", "html", "javascript", "json", "ledger",
    "lua", "python", "rst", "ruby", "rust", "toml", "yaml"
  },

  highlight = {
    enable = true
  },

  refactor = {
    highlight_definitions = {
      enable = true
    },
  },
}

if vim.fn.isdirectory(vim.fn.glob("~/.source/tree-sitter-openscad")) > 0 then
  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  parser_config.openscad = {
    install_info = {
      url = "~/.source/tree-sitter-openscad", -- local path or git repo
      files = {"src/parser.c"},
      -- optional entries:
      branch = "master", -- default branch in case of git repo if different from master
      generate_requires_npm = true, -- if stand-alone parser without npm dependencies
      requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    },
    filetype = "openscad", -- if filetype does not match the parser name
  }
end

vim.cmd([[
autocmd FileType c,cpp,python,js set foldmethod=expr
autocmd FileType c,cpp,python,js set foldexpr=nvim_treesitter#foldexpr()
]])
