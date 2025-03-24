#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# environment variables
export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR=vim

# nvm init
# source /usr/share/nvm/init-nvm.sh

# NVM
#source /usr/share/nvm/init-nvm.sh

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias bd='cd ~/.programs/BetterDiscord; pnpm inject; cd -;'
alias fucking='sudo'
alias kys='shutdown 0'
alias wiki=' 2>/dev/null firefox ~/documents/wiki/main/main.html'
alias laravel='~/.config/composer/vendor/bin/laravel'
alias diff='diff --color=always'
alias wl-copy='2>/dev/null wl-copy'

# Functions (are better than aliases ngl)
wallpaper() { ~/.scripts/colors/cwall.sh "$@";}
wallpaperchoose() { ~/.scripts/colors/cwallchoose.sh "$@";}
makepdf() { pandoc --highlight-style tango $* && mupdf $_; }

# shitty shits
hawk() { if [ "$1" == "tuah" ]; then echo 'spit on that thang!'; else echo 'bash: hawk: command not found' >&2; fi }

reload
