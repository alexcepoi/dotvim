set softtabstop=4 shiftwidth=4 expandtab
autocmd Filetype html setlocal softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype ruby setlocal softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype vim setlocal softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype tex setlocal textwidth=80 noexpandtab linebreak


autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal g'\"" |
      \ endif
