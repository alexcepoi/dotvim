" plugins
nnoremap <leader>w :CtrlPCurWD<cr>
nnoremap <leader>W :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>e :CtrlPClearAllCaches<cr>
nnoremap <leader>u :UndotreeToggle<CR>

" buffers
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

nmap <silent> <M-h> :bp<cr>
nmap <silent> <M-l> :bn<cr>
nmap <silent> <M-j> :Bd!<cr>
nmap <M-k> :e<space>

nmap <silent> <leader>h :bp<cr>
nmap <silent> <leader>l :bn<cr>
nmap <silent> <leader>j :Bd!<cr>
nmap <leader>k :e<space>

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

nmap <leader>gb :Gblame<cr>
nnoremap <leader>gs :GitGutterBaseToggle<cr>

" sane arrow key behaviour
nmap <S-Up> Vk
nmap <S-Down> Vj
nmap <S-Left> vb
nmap <S-Right> vw
vmap <S-Up> k
vmap <S-Down> j
vmap <S-Left> b
vmap <S-Right> w
imap <S-Up> <Esc>Vk
imap <S-Down> <Esc>Vj
imap <S-Left> <Esc>vb
imap <S-Right> <Esc>lvw

" change directory to current file
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" make Y behave like other capitals
nnoremap Y y$

" type <enter> after search to clear results
nnoremap <silent> <cr> :silent noh<cr><cr>

" show trailing whitespace
set list lcs=tab:\ \ ,trail:-,nbsp:¬
nnoremap <silent> <leader>s :set list!<cr>

" toggle paste mode
set pastetoggle=<F2>

" toggle tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>

" always open help in vertical pane
if has("autocmd")
  autocmd FileType help wincmd L
endif
