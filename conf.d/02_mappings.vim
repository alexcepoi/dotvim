" buffers
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-q> <C-w>q

map <silent> <M-h> :bp<cr>
map <silent> <M-l> :bn<cr>
map <silent> <M-j> :Bd!<cr>
map <M-k> :e 

nmap <silent> <M-1> <Plug>AirlineSelectTab1
nmap <silent> <M-2> <Plug>AirlineSelectTab2
nmap <silent> <M-3> <Plug>AirlineSelectTab3
nmap <silent> <M-4> <Plug>AirlineSelectTab4
nmap <silent> <M-5> <Plug>AirlineSelectTab5
nmap <silent> <M-6> <Plug>AirlineSelectTab6
nmap <silent> <M-7> <Plug>AirlineSelectTab7
nmap <silent> <M-8> <Plug>AirlineSelectTab8
nmap <silent> <M-9> <Plug>AirlineSelectTab9

nmap <silent> <leader>1 <Plug>AirlineSelectTab1
nmap <silent> <leader>2 <Plug>AirlineSelectTab2
nmap <silent> <leader>3 <Plug>AirlineSelectTab3
nmap <silent> <leader>4 <Plug>AirlineSelectTab4
nmap <silent> <leader>5 <Plug>AirlineSelectTab5
nmap <silent> <leader>6 <Plug>AirlineSelectTab6
nmap <silent> <leader>7 <Plug>AirlineSelectTab7
nmap <silent> <leader>8 <Plug>AirlineSelectTab8
nmap <silent> <leader>9 <Plug>AirlineSelectTab9

" change directory to current file
map <leader>d :cd %:p:h<cr>

" make Y behave like other capitals
nnoremap Y y$

" type <enter> after search to clear results
nnoremap <silent> <cr> :silent noh<cr><cr>

" show trailing whitespace
hi SpecialKey ctermfg=darkgrey guifg=darkgrey
set list lcs=tab:>\ ,trail:-
nmap <silent> <leader>s :set list!<cr>
