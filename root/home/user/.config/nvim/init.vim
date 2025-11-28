" source main configurations
source /usr/share/nvim/archlinux.lua

" getting terminal-specific options
if ($COLORTERM=="truecolor")
  colorscheme vimper
  set notermguicolors
  set title
  set titlestring=neovim\ -\ %t\ %m
else
  colorscheme vim
  set termguicolors
endif

" setting options
let g:markdown_fenced_languages = ['c', 'python', 'bash', 'sh']
set breakindent
set breakindentopt+=list:3
set clipboard+=unnamedplus
set cursorline
set cursorlineopt=both
set expandtab
set fillchars=eob:\ 
set guicursor=a:blinkwait0-blinkoff200-blinkon200
set ignorecase
set langmap=Ñ\\:
set linebreak
set matchpairs+=<:>
set noshowmode
set nowrap
set nrformats+=alpha
set number
set relativenumber
set shiftround
set shiftwidth=2
set shortmess+=I
set showcmdloc=statusline
set smartcase
set statusline=%#StatusLineNc#%(%w%m%r%)%*\ %.40f\ %{%GetMode()%}%{%GetFiletype()%}%{GetWrap()}%=%S%=%l/%LL,%c\ %{wordcount().bytes}B
set tabstop=2

" mapping commands
imap <C-Backspace> <C-w>
map <A-Enter> i<Esc>
map <A-Space> i <Esc>l
map <A-w> :set wrap! 
map <C-c> :set cursorcolumn! 

" functions
func! GetFiletype() abort
  return (&filetype=="") ? "" : "%y "
endfunc

func! GetWrap() abort
  return (&wrap==0) ? "" : "[wrap]"
endfunc

func! GetMode() abort
  let current_mode = nvim_get_mode().mode
  let modes = { "niI": "insert normal", "n": "normal", "no": "op. pending", "v": "visual", "V": "visual line", "": "visual block", "s": "select", "S": "select block", "i": "insert", "ic": "insert", "nii": "insert",  "R": "replace", "rv": "virtual replace", "c": "command", "cv": "vim ex", "ce": "ex", "r": "prompt", "rm": "moar", "r?": "confirm", "!": "shell", "t": "terminal", "nt": "terminal" }
  if (current_mode == 'n')
    return "[".modes[current_mode]."] "
  else
    return "%#StatusLineNC#[".modes[current_mode]."]%* "
  endif
endfunc

" custom commands
com! FormatJSON %!python -m json.tool
