call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Reewr/vim-monokai-phoenix'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'solarnz/thrift.vim'
Plug 'Valloric/YouCompleteMe', {
  \'do': './install.py --clang-completer',
  \'for': ['c', 'cpp', 'python'],
  \}
call plug#end()

filetype off
filetype plugin indent on
syntax on
" Shift width
set shiftwidth=4
" No compatible for vi
set nocompatible
" Hightlight search results.
set hlsearch
" Incremental search.
set incsearch
" Line number.
set number
" Fast cursur positioning.
set cursorline
set cursorcolumn
" Backspace on EOL.
set backspace=indent,eol,start
" Tab
set ts=4
set expandtab
set autoindent
colorscheme monokai-phoenix
" YouCompleteMe
let g:ycm_semantic_triggers = {
  \'c,cpp,python': ['re!\w{2}'],
  \}
" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'P'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme = 'violet'

let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Use terminal background color.
hi Normal ctermfg=NONE ctermbg=NONE
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE


