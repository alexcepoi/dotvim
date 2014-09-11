autocmd Filetype vim setlocal softtabstop=4 shiftwidth=4 expandtab
autocmd Filetype html setlocal softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript setlocal softtabstop=4 shiftwidth=4 expandtab
autocmd Filetype coffee setlocal softtabstop=4 shiftwidth=4 expandtab
autocmd Filetype ruby setlocal softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype python setlocal softtabstop=4 shiftwidth=4 expandtab
autocmd Filetype rst setlocal softtabstop=4 shiftwidth=4 expandtab
autocmd Filetype c,cpp setlocal softtabstop=4 shiftwidth=4 noexpandtab
autocmd Filetype tex setlocal textwidth=80 noexpandtab linebreak


autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\     if line("'\"") > 0 && line ("'\"") <= line("$") |
\         exe "normal g'\"" |
\     endif |
\ endif
