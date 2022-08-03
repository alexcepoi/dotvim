""" Completion
set completeopt=longest,menuone,popup
set wildmode=longest,list
set pumheight=20

""" Copy paste
set pastetoggle=<F2>
nnoremap Y y$

set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:↴,precedes:«,extends:»
nnoremap <silent> <leader>s :set list!<cr>

""" Indentation
set autoindent
set smartindent
set backspace=2
set colorcolumn=80,120

""" Filetype settings
augroup dotvim_filetypes
  autocmd!

  set tabstop=2 softtabstop=-1 shiftwidth=0 expandtab
  autocmd Filetype go setlocal tabstop=2 noexpandtab nowrap
  autocmd Filetype tex setlocal textwidth=80 noexpandtab linebreak

  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
augroup end

""" Emacs-style command line
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <Esc><C-b> <S-Left>
cnoremap <Esc><C-f> <S-Right>
