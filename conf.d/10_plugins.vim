""" Plugin setup
if !empty(glob('~/.vim/autoload/plug.vim'))
  call plug#begin()
  Plug 'base16-project/base16-vim'
  Plug 'haya14busa/vim-asterisk'
  Plug 'houtsnip/vim-emacscommandline'
  Plug 'justinmk/vim-dirvish'
  Plug 'eapache/auto-pairs'
  Plug 'markonm/traces.vim'
  Plug 'mbbill/undotree'
  Plug 'mhinz/vim-signify'
  Plug 'moll/vim-bbye'
  Plug 'ojroques/vim-oscyank'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'scrooloose/syntastic'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  call plug#end()

  " Fix yanking via remote terminal
  augroup dotvim_oscyank
    autocmd!
    autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif
  augroup end

  " airline
  set noshowmode
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
  augroup dotvim_airline
    autocmd!
    autocmd User AirlineAfterInit call AirlineInit()
  augroup end

  " dirvish
  nmap - <Plug>(dirvish_up)
  let g:dirvish_mode = ':sort ,^.*[\/],'
  augroup dotvim_dirvish
    autocmd!
    autocmd FileType dirvish nmap <buffer> q <Plug>(dirvish_quit)
    autocmd FileType dirvish silent! unmap <buffer> /
    autocmd FileType dirvish silent! unmap <buffer> ?
  augroup END

  " asterisk
  let g:asterisk#keeppos = 1
  map *  <Plug>(asterisk-z*)
  map #  <Plug>(asterisk-z#)
  map g* <Plug>(asterisk-gz*)
  map g# <Plug>(asterisk-gz#)

  " syntastic
  " let g:syntastic_check_on_open=1
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

  " vim-go
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_types = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
  let g:go_fmt_command = "goimports"

  " colorscheme
  if has('gui_running')
    set background=dark
    set guifont=Dejavu\ Sans\ Mono\ 9
    colorscheme base16-default-dark
    hi SpecialKey guifg=darkgrey
  endif

  " mappings
  nnoremap <silent> <leader>u :UndotreeToggle<CR>

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
