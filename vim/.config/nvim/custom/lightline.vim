let g:lightline = {
   \ 'colorscheme': 'wombat',
   \ 'active': {
   \   'left': [ [ 'mode', 'paste' ],
   \             [ 'fugitive', 'readonly', 'filename', 'modified' ],
   \             [ 'tag' ],
   \             [ 'neomake' ],
   \   ]
   \ },
   \ 'component': {
   \    'tag': '%{tagbar#currenttag("%s", "", "f")}',
   \ },
   \ 'component_function': {
      \ 'fugitive': 'LightlineFugitive',
   \ },
   \ 'component_expand': {
      \ 'neomake': 'LightlineNeomake',
   \ },
   \ 'component_type': {
      \ 'neomake': 'warning',
   \ }
\ }

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? "\ue0a0 ".branch : ''
  endif
  return ''
endfunction

function! LightlineNeomake()
  if exists("*neomake#GetJobs")
    let jobs = neomake#GetJobs()
    if !empty(jobs)
      return '*'
    endif
  endif
  return ''
endfunction

autocmd User NeomakeJobStarted call lightline#update()
autocmd User NeomakeJobFinished call lightline#update()
