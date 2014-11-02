
# # START PROFILE HEADER
# typeset -F SECONDS=0
# export START_TIME=$SECONDS
 
# if [ -e ~/.profiling ]; then
#   echo "zshrc started"
 
#   source() {
#     local before=$SECONDS
#     . $*
#     local duration=$((($SECONDS - $before) * 1000))
#     echo "$(printf '%7.2f' $duration)ms $*"
#   }
# fi
# # END PROFILE HEADER

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Programmable file renaming
# zmv '(*).txt' '$1.html'
autoload -U zmv

alias zmz='noglob zmv'
alias zcp='noglob zmv -C'
alias zln='noglob zmv -L'
alias zsy='noglob zmv -Ls'

# History
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

setopt listpacked              # compact completion lists
setopt listtypes               # show types in completion
setopt extendedglob            # weird & wacky pattern matching - yay zsh! Example: cp ^*.(tar|bz2|gz)
setopt correctall              # spelling correction
setopt braceccl                # sequences like {a-j}, {1..10}, etc
setopt automenu                # Automatically use menu completion after the second consecutive request for completion
setopt hist_ignore_all_dups    # History ignores duplicates
setopt hist_ignore_space       # Add space before command to prevent being recorded to history
# setopt autocd                  # Implicit cd
setopt nonomatch               # try to avoid the 'zsh: no matches found...'
# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Now we can pipe to multiple outputs!
setopt MULTIOS

# This will use named dirs when possible
setopt AUTO_NAME_DIRS

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# No more annoying pushd messages...
# setopt PUSHD_SILENT

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# use magic (this is default, but it can't hurt!)
setopt ZLE

setopt NO_HUP

# only fools wouldn't do this ;-)
export EDITOR="subl -n -w"

setopt IGNORE_EOF

# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL

# Keep echo "station" > station from clobbering station
setopt NO_CLOBBER

# Case insensitive globbing
setopt NO_CASE_GLOB

# Be Reasonable!
setopt NUMERIC_GLOB_SORT

# I don't know why I never set this before.
setopt EXTENDED_GLOB

# hows about arrays be awesome?  (that is, frew${cool}frew has frew surrounding all the variables, not just first and last
setopt RC_EXPAND_PARAM

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space

# to give a directory an alias, you use hash. hash -d projs=~/projects/

function pdfwc() {
	echo `pdftotext $1 - | egrep -E '\w\w\w+' | wc -w`
}

# Customize to your needs...
export PATH=/usr/local/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/sbin:$PATH

# RVM
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# SLOW
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"


#export PATH=$PATH:~/sublime_text_3/
if hash subl 2>/dev/null; then
	export EDITOR="subl -w"
fi

# SLOW
# Fasd - fast jumping around
if hash fasd 2>/dev/null; then
	eval "$(fasd --init auto)"
fi

# alias youtube='~/Github/youtube-dl/youtube-dl -t' 
alias kb="setxkbmap us -variant colemak"   # Colemak keyboard layout
alias kbsi="setxkbmap si"                  # Slovenian keyboard layout
alias dotfiles="~/Dropbox/Misc/Github/dotfiles"
alias tp=trash-put # install trash-cli first
# alias rm=tp
# alias rm-real=rm
alias open=xdg-open
# alias mounti="sshfs pdk10@shell1.doc.ic.ac.uk:/homes/pdk10 ~/imperial"
# alias mountrobot="sshfs pi@129.31.195.68:/home/pi ~/robot"
alias largestfiles="find -type f -ls | sort -k 7 -r -n | head |tr -s ' ' | cut -d' ' -f7,11,12,13,14,15,16,17,18,19"
# alias pi="~dcw/tmp/git-clone-test/raspberry-pi-wifi/ssh-pi 80:1f:02:af:31:19"
# alias picsh="bash -c 'export PERL5LIB=/homes/dcw/tmp/git-clone-test/raspberry-pi-wifi/PERSISTENT_TUPLES; ./scp-pi 80:1f:02:af:31:19'"


# export ICL_USER_PASS=$(cat ~/.icl)
# piip=129.31.198.39
# alias pi-ssh="ssh pi@${piip} -X"
# alias pi-scp="scp ./*.py pi@${piip}:~/prac-files/"
# alias pi-ip='curl -s --data "macaddress=80:1f:02:af:31:19" --user $ICL_USER_PASS https://www.doc.ic.ac.uk/~jrj07/robotics/index.cgi | grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" | head -n 1'
# alias pi-ssh="ssh pi@`pi-ip` -X"
# alias pi-scp="scp ./*.py pi@`pi-ip`:~/prac-files/"

alias i3-lock="i3lock" # called from the i3-exit script
alias i3lock="i3lock -c 000000"
alias google-keep="google-chrome --app-id=hmjkmjkepdijhoojdojkdfohbdgmmhki"

# Terminal 256 colors
export TERM="xterm-256color"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Virutal Wrapper config for Django
# source /usr/local/bin/virtualenvwrapper.sh
# export WORKON_HOME=~/Envs 

# export PATH=$PATH:/home/pedro/Envs/grid/lib/python2.7/site-packages
# export PYTHONPATH="/home/pedro/Envs/grid/lib/python2.7/site-packages:$PYTHONPATH"

# # START PROFILE FOOTER
# # show total load time
# duration=$((($SECONDS - $START_TIME) * 1000))
# echo "\033[1;30m($(printf '%.2f' $duration)ms)\033[0m"
# # END PROFILE FOOTER

# unalias gm # Conflics with Graphicsmagic