" plugins setup
filetype off
set rtp+=/etc/vim/bundle/Vundle.vim
call vundle#begin('/etc/vim/bundle')

Plugin 'airblade/vim-gitgutter'
Plugin 'amiorin/vim-project'
Plugin 'bling/vim-airline'
Plugin 'blueyed/vim-diminactive'
Plugin 'chriskempson/base16-vim'
Plugin 'felikz/ctrlp-py-matcher'
Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mbbill/undotree'
Plugin 'mileszs/ack.vim'
Plugin 'moll/vim-bbye'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'Valloric/MatchTagAlways'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

call vundle#end()
filetype plugin indent on

" colorscheme
if has('gui_running')
  set background=dark
  colorscheme base16-default
  hi SpecialKey guifg=darkgrey
else
  set background=light
  hi LineNr ctermfg=yellow ctermbg=none
  hi SignColumn ctermbg=none
  hi Visual cterm=reverse ctermbg=black
  hi Search cterm=bold ctermfg=black
  hi Normal ctermbg=234
  hi ColorColumn ctermbg=235
  hi SpecialKey ctermfg=darkgrey
end

" airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#enabled=0

" gist
let g:gist_detect_filetype=1
let g:gist_open_browser_after_post=1
let g:gist_show_privates=1
let g:gist_post_private=1

" ctrlp
if executable('ag')
  let s:ctrlp_fallback = 'ag %s -i --nocolor --nogroup --hidden -g ""'
else
  let s:ctrlp_fallback = 'find %s -type f'
endif

let g:ctrlp_user_command={
      \  'types': {
      \    1: ['.git', 'cd %s && git ls-files'],
      \    2: ['.hg', 'hg --cwd %s locate -I .'],
      \  },
      \  'fallback': s:ctrlp_fallback
      \}

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_map = ''

" ultisnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_enable_highlighting=0
let g:syntastic_stl_format='%E{E%e}%B{, }%W{W%w}'

" gutter
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_column_always=1

" undotree
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_TreeNodeShape = 'o'
let g:undotree_SplitWidth = 40

" ack
let g:ack_use_dispatch = 1

" notes
let g:notes_directories = ['~/notes']
