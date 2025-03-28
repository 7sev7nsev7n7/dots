" color scheme
colorscheme vimper
" source main configurations
source /usr/share/nvim/archlinux.lua

" setting options
set breakindent
set breakindentopt+=sbr
set clipboard+=unnamedplus
set cpoptions+=n
set cursorline
set cursorlineopt=number
set guicursor=a:blinkon100
set linebreak
set modelines=0
set notermguicolors
set number
set relativenumber
set shiftwidth=2
let &showbreak='>'
set statuscolumn=%l\ %r\ 
set tabstop=8

" mapping commands
map <C-C> :set cursorcolumn! 
