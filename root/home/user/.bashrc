#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='\[\e[31m\]\u@\h \[\e[90m\]\w\[\e[0m\] \$ '

# vi mode
set -o vi

# environment variables
export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR=vim
export MANPAGER='vim +Man!'

# Aliases
alias bd='cd ~/.programs/BetterDiscord; git pull; bun install; bun run build; bun inject; cd -'
alias colors='wal --preview'
alias grep='grep --color=auto'
alias ls='lsd --color=auto -F --group-dirs first'
alias o='xdg-open'
alias pandoc='pandoc --highlight-style zenburn'
alias todo='vim ~/.todo'
alias wl-copy='2>/dev/null wl-copy'

# Functions (are better than aliases ngl)
wallpaper() { # change wallpaper to file
  ~/.scripts/colors/cwall.sh "$@"
}
wallpaperchoose() { # choose wallpaper from a directory
  ~/.scripts/colors/cwallchoose.sh "$@"
}
makepdf() { # make a pdf and view it
  pandoc --highlight-style zenburn $* && mupdf $_
}
showmd() { # preview a pdf file (this function only creates a temporary file)
  pandoc --highlight-style zenburn $1 -o /tmp/$1.pdf "${@:2}" && mupdf /tmp/$1.pdf && rm /tmp/$1.pdf
}

reload
