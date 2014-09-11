set rtp+=/etc/vim/bundle/Vundle.vim
call vundle#begin('/etc/vim/bundle')

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'amiorin/vim-project'
Plugin 'tomtom/tcomment_vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'

Plugin 'LaTeX-Box-Team/LaTeX-Box'

call vundle#end()


let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamecollapse=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='bubblegum'

let g:gist_detect_filetype=1
let g:gist_open_browser_after_post=1
let g:gist_show_privates=1
let g:gist_post_private=1

let g:ctrlp_user_command={
    \'types': {
        \1: ['.git', 'cd %s && git ls-files'],
        \2: ['.hg', 'hg --cwd %s locate -I .'],
    \},
    \'fallback': 'find %s -type f',
\}

let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting=0
let g:airline#extensions#whitespace#enabled=0
let g:syntastic_stl_format='%E{E%e}%B{, }%W{W%w}'
" let g:syntastic_auto_loc_list=1
" let g:syntastic_loc_list_height=5

let g:gitgutter_sign_column_always=1
highlight SignColumn ctermbg=black
