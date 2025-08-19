" getting terminal-specific options
if ($COLORTERM=="truecolor")
  colorscheme vimper
  set title
  set titlestring=neovim\ -\ %t\ %m
  set notermguicolors
  set showbreak=│
  set statuscolumn=%l\ %=\│
else
  colorscheme default
  set termguicolors
  set showbreak=\| 
  set statuscolumn=%l\ %=\| 
endif

" source main configurations
source /usr/share/nvim/archlinux.lua

" setting options
set breakindent
set breakindentopt+=list:3,shift:-1
set clipboard+=unnamedplus
set cursorline
set cursorlineopt=number
set expandtab
set fillchars=eob:\ 
set guicursor=a:blinkwait0-blinkoff200-blinkon200
set ignorecase
set linebreak
set matchpairs+=<:>
set nrformats+=alpha
set notermguicolors
set number
set relativenumber
set shiftround
set shiftwidth=2
set shortmess+=I
set showcmdloc=statusline
set noshowmode
set smartcase
set statusline=%#ErrorMsg#%(%w%m%r%)%*\ %.40f\ %{%GetMode()%}%{%GetFiletype()%}%{GetWrap()}%=%S%=%.(%l,%c%)\ (%LL)%*
set tabstop=2
set nowrap

" mapping commands
map <C-c> :set cursorcolumn! 
map <A-w> :set wrap! 
map <A-o> o<Esc>
map <A-O> O<Esc>
map <A-Space> i <Esc>l
map <A-Enter> i<Esc>

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

" vim:wrap
