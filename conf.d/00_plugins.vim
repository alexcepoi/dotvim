" plugins setup
filetype off
set rtp+=/etc/vim/bundle/Vundle.vim
call vundle#begin('/etc/vim/bundle')

Plugin 'airblade/vim-gitgutter'
Plugin 'amiorin/vim-project'
Plugin 'blueyed/vim-diminactive'
Plugin 'chriskempson/base16-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'felikz/ctrlp-py-matcher'
Plugin 'gmarik/Vundle.vim'
Plugin 'haya14busa/vim-asterisk'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'leafgarland/typescript-vim'
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
Plugin 'jeetsukumaran/vim-filebeagle'
Plugin 'Valloric/MatchTagAlways'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

call vundle#end()
filetype plugin indent on

" colorscheme
if has('gui_running')
  set background=dark
  set guifont=Monospace\ 8
  colorscheme base16-default
  hi SpecialKey guifg=darkgrey
else
  set background=light
  hi LineNr ctermfg=yellow ctermbg=none
  hi SignColumn ctermbg=none
  hi Visual cterm=reverse ctermbg=black
  hi Search cterm=bold ctermfg=black
  " hi Normal ctermbg=234
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

let g:airline_fnamemod = ":~:."
function! AirlineInit()
  let fname = '%{fnamemodify(expand("%:p"), "' .  g:airline_fnamemod . '")}'
  let g:airline_section_c = airline#section#create(['%<']) . fname .
        \ airline#section#create([' ', 'readonly'])
endfunction
if has("autocmd")
  autocmd User AirlineAfterInit call AirlineInit()
endif

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
      \   'types': {
      \     1: ['.git', 'cd %s && git ls-files'],
      \     2: ['.hg', 'hg --cwd %s locate -I .'],
      \   },
      \   'fallback': s:ctrlp_fallback
      \ }

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_map = ''

" asterisk
let g:asterisk#keeppos = 1
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

" ultisnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_enable_highlighting=0
let g:syntastic_stl_format='%E{E%e}%B{, }%W{W%w}'

" gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_column_always=1

let g:gitgutter_diffs = {'HEAD': 'HEAD', 'master': 'master'}
let g:gitgutter_diff_name = 'HEAD'
let g:gitgutter_diff_args = g:gitgutter_diffs[g:gitgutter_diff_name]

function! GitGutterEnable()
  if empty(g:gitgutter_diffs)
    echo 'Gitgutter: g:gitgutter_diffs is empty'
  else
    let diff_names = sort(keys(g:gitgutter_diffs))

    let curr_ix = index(diff_names, g:gitgutter_diff_name)
    if curr_ix == -1
      echo 'Gitgutter: g:gitgutter_name is not present in g:gitgutter_diffs'
    else
      let g:gitgutter_diff_name = get(diff_names, curr_ix, diff_names[0])
      let g:gitgutter_diff_args = g:gitgutter_diffs[g:gitgutter_diff_name]
      call gitgutter#enable()
    endif
  endif
endfunction

function! GitGutterBaseToggle()
  if empty(g:gitgutter_diffs)
    echo 'Gitgutter: g:gitgutter_diffs is empty'
  else
    let diff_names = sort(keys(g:gitgutter_diffs))

    " If not found in list, index will return -1 and we fetch first vaue.
    let curr_ix = index(diff_names, g:gitgutter_diff_name)
    let g:gitgutter_diff_name = get(diff_names, curr_ix + 1, diff_names[0])
    let g:gitgutter_diff_args = g:gitgutter_diffs[g:gitgutter_diff_name]

    echo 'GitGutter: diffing against' g:gitgutter_diff_name
    call GitGutterEnable()
  endif
endfunction

if has("autocmd")
  augroup enter
    autocmd!
    autocmd VimEnter * call GitGutterEnable()
  augroup END
endif
command! GitGutterBaseToggle :call GitGutterBaseToggle()

" undotree
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_TreeNodeShape = 'o'
let g:undotree_SplitWidth = 40

" ack
let g:ack_use_dispatch = 1

" filebeagle
let g:filebeagle_show_hidden = 1

" notes
let g:notes_directories = ['~/notes']

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
