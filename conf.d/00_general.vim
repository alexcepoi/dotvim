""" Look & Feel
set title
set hidden
set ruler
set nobackup
set noswapfile
set autoread
set showcmd
set number
set laststatus=2
set ttimeoutlen=50

set noerrorbells visualbell t_vb=
augroup dotvim_gui
  autocmd!
  autocmd GUIEnter * set visualbell t_vb=
augroup end

""" Theme
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set guiheadroom=0

set background=light
hi LineNr ctermfg=yellow ctermbg=none
hi SignColumn ctermbg=none
hi Visual cterm=reverse ctermbg=black
hi Search cterm=bold ctermfg=black
hi ColorColumn ctermbg=235
hi StatusLine term=none cterm=none ctermbg=236 ctermfg=green
hi StatusLineNC term=none cterm=none ctermbg=239 ctermfg=lightgrey
hi SpecialKey ctermfg=darkgrey
