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
alias ls='lsd --color=auto -F'
alias grep='grep --color=auto'
alias bd='cd ~/.programs/BetterDiscord; pnpm inject; cd -;'
alias fucking='sudo'
alias kys='shutdown 0'
alias diff='diff --color=always'
alias wl-copy='2>/dev/null wl-copy'
alias sudo='sudo -E'
alias less='less --use-color'
alias o='xdg-open'

# Functions (are better than aliases ngl)
wallpaper() { ~/.scripts/colors/cwall.sh "$@";}
wallpaperchoose() { ~/.scripts/colors/cwallchoose.sh "$@";}
makepdf() { pandoc --highlight-style tango $* && mupdf $_; }

# shitty shits
hawk() { if [ "$1" == "tuah" ]; then echo 'spit on that thang!'; else echo 'bash: hawk: command not found' >&2; fi }

reload
