map <C-h> :bprev<cr>
map <C-l> :bnext<cr>
map <C-j> :bdel!<cr>
map <C-k> :edit 

" make Y behave like other capitals
nnoremap Y y$

" type <enter> after search to clear results
nnoremap <silent> <cr> :silent noh<cr><cr>

" show trailing whitespace <,s>
set listchars=tab:>\ ,trail:-
nmap <silent> <leader>s :set nolist!<cr>
