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
set cursorlineopt=both
set guicursor=a:blinkwait0-blinkoff200-blinkon200
set linebreak
set notermguicolors
set number
set relativenumber
set shiftwidth=2
let &showbreak='>'
set statuscolumn=%l\ %r\ 
set tabstop=8
set ignorecase
set smartcase

" mapping commands
map <C-C> :set cursorcolumn! 
