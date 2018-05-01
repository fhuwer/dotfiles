map <C-d> <Nop>
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_quit_key='<Esc>'

if has('nvim')
   " Called once right before you start selecting multiple cursors
   function! Multiple_cursors_before()
      if exists('g:deoplete#disable_auto_complete') == 1
         exe 'let g:deoplete#disable_auto_complete = 1'
      endif
   endfunction

   " Called once only when the multiple selection is canceled (default <Esc>)
   function! Multiple_cursors_after()
      if exists('g:deoplete#disable_auto_complete') == 1
         exe 'let g:deoplete#disable_auto_complete = 0'
      endif
   endfunction
endif
