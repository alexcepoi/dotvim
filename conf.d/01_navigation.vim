""" Navigation
set showmatch
set scrolloff=5
set splitbelow
set splitright
set nofoldenable

""" Search
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <silent> <cr> :silent noh<cr><cr>

""" Buffers
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

nnoremap <silent> <M-h> :bp<cr>
nnoremap <silent> <M-l> :bn<cr>
nnoremap <silent> <M-j> :bd<cr>
nnoremap <silent> <M-k> :enew<cr>

nnoremap <silent> <leader>h :bp<cr>
nnoremap <silent> <leader>l :bn<cr>
nnoremap <silent> <leader>j :bd<cr>
nnoremap <silent> <leader>k :enew<cr>

""" Netrw
let g:netrw_banner = 0
let g:netrw_dirhistmax = 0
let g:netrw_hide = 1
let g:netrw_list_hide = '^\./$'

noremap <silent> - :Explore!<cr>
augroup dotvim_netrw
  autocmd!
  autocmd FileType netrw noremap <buffer> <silent> <nowait> q :bd<cr>
augroup end
