""" Completion
set completeopt=longest,menuone
set wildmode=longest,list

""" Copy paste
set pastetoggle=<F2>
nnoremap Y y$

set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:↴,precedes:«,extends:»
nnoremap <silent> <leader>s :set list!<cr>
