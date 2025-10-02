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
export PATH="$PATH:/home/7sev7nsev7n7/.dotnet/tools"

# Aliases
alias ls='lsd --color=auto -F -1'
alias grep='grep --color=auto'
alias bd='cd ~/.programs/BetterDiscord; pnpm inject; cd -;'
alias fucking='sudo'
alias diff='diff --color=always'
alias wl-copy='2>/dev/null wl-copy'
alias sudo='sudo -E'
alias less='less --use-color'
alias o='xdg-open'
alias todo='vim ~/.todo'
alias pandoc='pandoc --highlight-style tango'

# Functions (are better than aliases ngl)
wallpaper() { ~/.scripts/colors/cwall.sh "$@";} # change wallpaper to file
wallpaperchoose() { ~/.scripts/colors/cwallchoose.sh "$@";} # choose wallpaper from a directory
makepdf() { pandoc --highlight-style tango $* && mupdf $_; } # make a pdf and view it
showmd() { pandoc --highlight-style tango $1 -o /tmp/$1.pdf "${@:2}" && mupdf /tmp/$1.pdf && rm /tmp/$1.pdf; } # preview a pdf file (this function only creates a temporary file)

# shitty shits
hawk() { if [ "$1" == "tuah" ]; then echo 'spit on that thang!'; else echo 'bash: hawk: command not found' >&2; fi }

reload
