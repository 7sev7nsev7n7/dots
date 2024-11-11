#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# nvm init
# source /usr/share/nvm/init-nvm.sh

# NVM
source /usr/share/nvm/init-nvm.sh

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias bd='cd ~/.programs/BetterDiscord; pnpm inject; cd;'
alias fucking='sudo'
alias kys='shutdown 0'

# Functions (are better than aliases ngl)
wallpaper() { ~/.scripts/colors/cwall.sh "$@";}
mood() { python ~/.scripts/discord_webhooks/moodtracker.py "$@";}

reload
