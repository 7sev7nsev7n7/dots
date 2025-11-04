#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vi mode
set -o vi

# environment variables
export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR=vim
export MANPAGER='vim +Man!'
export PATH="$PATH:/home/7sev7nsev7n7/.dotnet/tools"

# Aliases
alias bd='cd ~/.programs/BetterDiscord; pnpm inject; cd -;'
alias colors='wal --preview'
alias diff='diff --color=always'
alias fucking='sudo'
alias grep='grep --color=auto'
alias less='less --use-color'
alias ls='lsd --color=auto -F'
alias o='xdg-open'
alias pandoc='pandoc --highlight-style zenburn'
alias sudo='sudo -E'
alias todo='vim ~/.todo'
alias wl-copy='2>/dev/null wl-copy'
alias dunstlog='vim -R ~/.cache/dunstlog'

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

# shitty shits
hawk() { if [ "$1" == "tuah" ]; then echo 'spit on that thang!'; else echo 'bash: hawk: command not found' >&2; fi }

reload
