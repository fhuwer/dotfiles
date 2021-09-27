-- vim.g["vimtex_mappings_enabled"] = 0
vim.g["vimtex_motion_enabled"] = 1
vim.g["vimtex_view_method"] = 'zathura'
vim.g["vimtex_fold_enabled"] = 1
vim.g["tex_flavor"] = 'latex' 
vim.g["vimtex_comiler_latexmk"] = {
  build_dir = ".build/", 
}
vim.env["VIMTEX_OUTPUT_DIRECTORY"] = ".build/"
-- vim.g["vimtex_view_zathura_options"] = '-s'


-- vim.api.nvim_exec([[
-- function! VimtexViewFocus()
--   let result = system('xdotool getactivewindow')
--   let self.texfile = vimtex#paths#relative(expand('%:p'), b:vimtex.root)
--   let self.outfile = vimtex#paths#relative(a:outfile, getcwd())

--   let l:cmd  = 'zathura --synctex-forward '
--   let l:cmd .= line('.')
--   let l:cmd .= ':' . col('.')
--   let l:cmd .= ':' . vimtex#util#shellescape(self.texfile)
--   let l:cmd .= ' ' . vimtex#util#shellescape(self.outfile)
--   call vimtex#process#run(l:cmd)
--   let self.cmd_forward_search = l:cmd
--   execute "sleep 200m"
--   let result = system('i3-msg "[id=' . result . '] focus"')
-- endfunc
-- ]], false)
vim.api.nvim_exec([[
function! VimtexViewFocus()
  let result = system('xdotool getactivewindow')
  execute ":VimtexView"
  execute "sleep 200m"
  let result = system('i3-msg "[id=' . result . '] focus"')
endfunc
]], false)
--function VimtexViewFocus()
  --result = vim.api.nvim_exec([[system("xdotool getactivewindow")]], true)
  --vim.cmd([[execute ":VimtexView"]])
  --vim.cmd([[sleep 200m]])
  --vimd.cmd([[system('i3-msg "[id=' . result . '] focus"')]])
--end


vim.api.nvim_set_keymap("n", "%", "<plug>vimtex-%", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>v", ":call VimtexViewFocus()<cr>", {noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>v", ":VimtexView<cr>", {noremap = true})
