" move buffers
map <C-h> :bp<cr>
map <C-l> :bn<cr>
map <C-j> :bd!<cr>
map <C-k> :e 

" make Y behave like other capitals
nnoremap Y y$

" type <enter> after search to clear results
nnoremap <silent> <cr> :silent noh<cr><cr>

" show trailing whitespace <,s>
set listchars=tab:>\ ,trail:-
nmap <silent> <leader>s :set nolist!<cr>
