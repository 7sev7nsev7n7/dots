" color scheme
colorscheme vimper

" source main configurations
source /usr/share/nvim/archlinux.lua

" setting options
set breakindent
set breakindentopt+=list:1
set clipboard+=unnamedplus
set cursorline
set cursorlineopt=both
set expandtab
set fillchars=eob:\ 
set guicursor=a:blinkwait0-blinkoff200-blinkon200
set ignorecase
set linebreak
set matchpairs+=<:>
set number
set notermguicolors
set relativenumber
set shiftround
set shiftwidth=2
let &showbreak='│ '
set showcmdloc=statusline
set smartcase
set statuscolumn=%l\ %=\│\ 
set statusline=%#StatusLineNC#%(%w%m%r%)%#StatusLine#\ %f%{%FileType()%}%{Wrap()}%=%S%=%.(%l,%v%)\ \|\ %P\ (%L)
set tabstop=2
set title
set titlestring=%t\ %m
set nowrap

" mapping commands
map <C-C> :set cursorcolumn! 
map <A-w> :set wrap! 

" functions
func! FileType() abort
  return (&filetype=="") ? "" : " [%Y]"
endfunc

func! Wrap() abort
  return (&wrap) ? " [WRAP]" : ""
endfunc
