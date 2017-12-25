""" Indentation
set autoindent
set smartindent
set backspace=2
set colorcolumn=80

""" Filetype settings.
augroup dotvim_filetypes
  autocmd!

  set softtabstop=2 shiftwidth=2 expandtab
  autocmd Filetype html setlocal softtabstop=2 shiftwidth=2 expandtab
  autocmd Filetype ruby setlocal softtabstop=2 shiftwidth=2 expandtab
  autocmd Filetype go setlocal tabstop=2 noexpandtab nowrap
  autocmd Filetype vim setlocal softtabstop=2 shiftwidth=2 expandtab
  autocmd Filetype tex setlocal textwidth=80 noexpandtab linebreak

  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
augroup end
