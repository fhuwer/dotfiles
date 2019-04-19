map <C-d> <Nop>
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_quit_key='<Esc>'

if has('nvim')
  " Called once right before you start selecting multiple cursors
  function! Multiple_cursors_before()
    if exists('*deoplete#custom#buffer_option') == 1
      call deoplete#custom#buffer_option('auto_complete', v:false)
    endif
  endfunction

  " Called once only when the multiple selection is canceled (default <Esc>)
  function! Multiple_cursors_after()
    if exists('*deoplete#custom#buffer_option') == 1
      call deoplete#custom#buffer_option('auto_complete', v:true)
    endif
  endfunction
endif
