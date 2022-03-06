""" Plugin setup
if !empty(glob('~/.vim/autoload/plug.vim'))
  " polyglot
  let g:polyglot_disabled = ['c/c++', 'c++11']

  call plug#begin('~/.vim/plugged')
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'chriskempson/base16-vim'
  Plug 'felikz/ctrlp-py-matcher'
  Plug 'haya14busa/vim-asterisk'
  Plug 'houtsnip/vim-emacscommandline'
  Plug 'justinmk/vim-dirvish'
  Plug 'eapache/auto-pairs'
  Plug 'majutsushi/tagbar'
  Plug 'mattn/gist-vim'
  Plug 'mattn/webapi-vim'
  Plug 'mbbill/undotree'
  Plug 'mhinz/vim-signify'
  Plug 'moll/vim-bbye'
  Plug 'scrooloose/syntastic'
  Plug 'sheerun/vim-polyglot'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-fugitive'
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

  " Workaround for misterious `undefined b:buffer` error.
  let g:airline#extensions#dirvish#enabled = 0

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

  " dirvish
  let g:dirvish_mode = ':sort ,^.*[\/],'
  nmap - <Plug>(dirvish_up)
  augroup dirvish_config
    autocmd!
    autocmd FileType dirvish nmap <buffer> q <Plug>(dirvish_quit)
    autocmd FileType dirvish silent! unmap <buffer> /
    autocmd FileType dirvish silent! unmap <buffer> ?
  augroup END

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
  " let g:ctrlp_map = ''

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

  " auto-pairs
  let g:AutoPairsUseInsertedCount=1
  let g:AutoPairsMultilineClose=1

  " signify
  set signcolumn=yes
  let g:signify_vcs_list = [ 'git', 'hg' ]
  let g:signify_sign_change = '~'
  let g:signify_sign_show_count = 0
  let g:signify_realtime = 1

  " undotree
  let g:undotree_SetFocusWhenToggle = 1
  let g:undotree_TreeNodeShape = 'o'
  let g:undotree_SplitWidth = 40

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
