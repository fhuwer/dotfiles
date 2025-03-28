local M = { "numToStr/Comment.nvim" }

M.opts = {
  padding = true,
  sticky = true,
  toggler = {
    line = ';c<space>',
    block = 'gbc',
  },
  opleader = {
    line = ';c<space>',
    block = ';cc',
  },
  mappings = {
    basic = true,
    extra = false,
  },
  pre_hook = nil,
  post_hook = nil,
}

return M
