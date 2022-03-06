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

nnoremap <silent> - :Explore<cr>
augroup dotvim_netrw
  autocmd!
  autocmd FileType netrw noremap <buffer> <silent> <nowait> q :Rex<cr>
augroup end

""" Close hidden buffers
function! DeleteHiddenBuffers()
  let tpbl=[]
  let closed = 0
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    if getbufvar(buf, '&mod') == 0
      silent execute 'bwipeout' buf
      let closed += 1
    endif
  endfor
  echo "Closed ".closed." hidden buffers"
endfunction

nnoremap <silent> <M-j> :Bd!<cr>
nnoremap <silent> <leader>j :Bd!<cr>
nnoremap <silent> <leader>x :call DeleteHiddenBuffers()<cr>
