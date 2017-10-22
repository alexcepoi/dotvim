""" Completion
set completeopt=longest,menuone
set wildmode=longest,list

""" Copy paste
set clipboard=unnamed,unnamedplus
set pastetoggle=<F2>
nnoremap Y y$

set list lcs=tab:\ \ ,trail:-,nbsp:¬
nnoremap <silent> <leader>s :set list!<cr>
