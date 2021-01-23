export WORKON_HOME=/home/pedro/.virtualenvs/
export PROJECT_HOME=/home/pedro/projects/
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
# f
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
export HISTSIZE=20000
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
export PATH=/usr/local/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/sbin:/home/pedro/Downloads/wine-tkg-git/wine-tkg-git/non-makepkg-builds/wine-tkg-staging-fsync-git-6.0rc3.r1.g7ad10427/bin:$PATH



if hash subl 2>/dev/null; then
	export EDITOR="subl -w"
fi

# SLOW
# Fasd - fast jumping around
if hash fasd 2>/dev/null; then
	eval "$(fasd --init auto)"
fi

alias kb="setxkbmap us -variant colemak"   # Colemak keyboard layout
alias kbsi="setxkbmap si"                  # Slovenian keyboard layout
alias tp=trash-put # install trash-cli first
# alias rm=tp
# alias rm-real=rm
alias open=xdg-open
alias largestfiles="find -type f -ls | sort -k 7 -r -n | head |tr -s ' ' | cut -d' ' -f7,11,12,13,14,15,16,17,18,19"

# Terminal 256 colors
export TERM="xterm-256color"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

### Virutal Wrapper config for Django
# where to store our virtual envs
export WORKON_HOME=$HOME/.virtualenvs 
# where projects will reside
export PROJECT_HOME=$HOME/projects/
# where is the virtualenvwrapper.sh
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh


# # START PROFILE FOOTER
# # show total load time
# duration=$((($SECONDS - $START_TIME) * 1000))
# echo "\033[1;30m($(printf '%.2f' $duration)ms)\033[0m"
# # END PROFILE FOOTER

# unalias gm # Conflics with Graphicsmagic


# Optimal image resizing
# smartresize inputfile.png 300 outputdir/
smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

# smartresizekeepsize inputfile.png outputdir/
smartresizekeepsize() {
   sz=$(identify $1 | cut -d' ' -f3)
   echo $1 $sz
   mogrify -path $2 -filter Triangle -define filter:support=2 -thumbnail $sz -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export WINEESYNC=1
