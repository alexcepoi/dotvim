""" Plugin setup
if !empty(glob('~/.vim/autoload/plug.vim'))
  call plug#begin('~/.vim/plugged')
  Plug 'Valloric/MatchTagAlways'
  Plug 'airblade/vim-gitgutter'
  Plug 'blueyed/vim-diminactive'
  Plug 'chriskempson/base16-vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'felikz/ctrlp-py-matcher'
  Plug 'haya14busa/vim-asterisk'
  Plug 'houtsnip/vim-emacscommandline'
  Plug 'jeetsukumaran/vim-filebeagle'
  Plug 'jiangmiao/auto-pairs'
  Plug 'majutsushi/tagbar'
  Plug 'mattn/gist-vim'
  Plug 'mattn/webapi-vim'
  Plug 'mbbill/undotree'
  Plug 'moll/vim-bbye'
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'scrooloose/syntastic'
  Plug 'sheerun/vim-polyglot'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
  call plug#end()

  " airline
  set noshowmode
  let g:airline_left_sep=''
  let g:airline_right_sep=''
  let g:airline_theme='bubblegum'
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline#extensions#tagbar#enabled = 0
  let g:airline#extensions#whitespace#enabled=0

  let g:airline_fnamemod = ":~:."
  function! AirlineInit()
    let fname = '%{fnamemodify(expand("%:p"), "' .  g:airline_fnamemod . '")}'
    let g:airline_section_c = airline#section#create(['%<']) . fname .
          \ airline#section#create([' ', 'readonly'])
  endfunction
  augroup dotvim_airline
    autocmd!
    autocmd User AirlineAfterInit call AirlineInit()
  augroup end

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

  " syntastic
  let g:syntastic_check_on_open=1
  let g:syntastic_mode_map = {'mode': 'passive'}
  let g:syntastic_enable_highlighting=0
  let g:syntastic_stl_format='%E{E%e}%B{, }%W{W%w}'

  " polyglot
  let g:polyglot_disabled = ['c/c++', 'c++11']

  " auto-pairs
  let g:AutoPairsMultilineClose=0

  " gitgutter
  let g:gitgutter_map_keys = 0
  set signcolumn=yes

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
        if exists("gitgutter#enable")
          call gitgutter#enable()
        endif
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

  augroup dotvim_gutter
    autocmd!
    autocmd VimEnter * call GitGutterEnable()
  augroup end
  command! GitGutterBaseToggle :call GitGutterBaseToggle()

  " undotree
  let g:undotree_SetFocusWhenToggle = 1
  let g:undotree_TreeNodeShape = 'o'
  let g:undotree_SplitWidth = 40

  " filebeagle
  let g:filebeagle_show_hidden = 1

  " tagbar
  let g:tagbar_vertical = 50
  let g:tagbar_autofocus = 1
  let g:tagbar_autoclose = 1
  let g:tagbar_compact = 1

  " vim-go
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_types = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
  let g:go_fmt_command = "goimports"

  " notes
  let g:notes_directories = ['~/notes']

  " colorscheme
  if has('gui_running')
    set background=dark
    set guifont=Dejavu\ Sans\ Mono\ 9
    colorscheme base16-default-dark
    hi SpecialKey guifg=darkgrey
  endif

  " mappings
  nnoremap <silent> <leader>w :CtrlPCurWD<cr>
  nnoremap <silent> <leader>W :CtrlP<cr>
  nnoremap <silent> <leader>b :CtrlPBuffer<cr>
  nnoremap <silent> <leader>e :CtrlPClearAllCaches<cr>
  nnoremap <silent> <leader>u :UndotreeToggle<CR>
  nnoremap <silent> <leader>gs :GitGutterBaseToggle<cr>
  nnoremap <silent> <leader>t :TagbarToggle<cr>

  nnoremap <silent> <M-j> :Bd!<cr>
  nnoremap <silent> <leader>j :Bd!<cr>

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
endif
