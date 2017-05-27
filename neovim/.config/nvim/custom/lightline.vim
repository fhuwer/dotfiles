let g:lightline = {
   \ 'colorscheme': 'wombat',
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ],
   \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
   \ },
   \ 'component_function': {
      \ 'fugitive': 'LightlineFugitive'
   \ },
\ }

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? "\ue0a0 ".branch : ''
  endif
  return ''
endfunction
