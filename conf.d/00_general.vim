""" Look & Feel
set hidden
set ruler
set nobackup
set noswapfile
set autoread
set showcmd
set number
set laststatus=2
set ttimeoutlen=50
set mouse=a
set noerrorbells visualbell t_vb=

""" Theme
if has('gui_running')
  set title
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=L
  set guiheadroom=0

  augroup dotvim_gui
    autocmd!
    autocmd GUIEnter * set visualbell t_vb=
  augroup end
endif

set background=light
hi LineNr ctermfg=yellow ctermbg=none
hi SignColumn ctermbg=none
highlight SignifySignAdd    ctermbg=none ctermfg=119
highlight SignifySignDelete ctermbg=none ctermfg=167
highlight SignifySignChange ctermbg=none ctermfg=227
hi Visual cterm=reverse ctermbg=black
hi Search cterm=bold ctermfg=black
hi ColorColumn ctermbg=235
hi StatusLine term=none cterm=none ctermbg=236 ctermfg=green
hi StatusLineNC term=none cterm=none ctermbg=239 ctermfg=lightgrey
hi SpecialKey ctermfg=darkgrey
hi NonText ctermfg=239
