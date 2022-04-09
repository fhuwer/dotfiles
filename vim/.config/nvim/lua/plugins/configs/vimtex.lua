-- vim.g["vimtex_mappings_enabled"] = 0
vim.g["vimtex_motion_enabled"] = 1
vim.g["vimtex_view_method"] = 'zathura'
vim.g["vimtex_fold_enabled"] = 1
vim.g["tex_flavor"] = 'latex' 
vim.g["vimtex_comiler_latexmk"] = {
  build_dir = ".build/", 
}
vim.env["VIMTEX_OUTPUT_DIRECTORY"] = ".build/"

vim.api.nvim_exec([[
function! VimtexViewFocus()
  let result = system('xdotool getactivewindow')
  execute ":VimtexView"
  execute "sleep 200m"
  let result = system('i3-msg "[id=' . result . '] focus"')
endfunc
]], false)

-- vim.api.nvim_set_keymap("n", "%", "<plug>vimtex-%", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>v", ":call VimtexViewFocus()<cr>", {noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>v", ":VimtexView<cr>", {noremap = true})
