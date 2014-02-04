# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Advanced TAB completion
autoload -U compinit
compinit

# Anvanced Prompt support
autoload -U promptinit
promptinit

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
setopt autocd                  # Implicit cd
setopt nonomatch               # try to avoid the 'zsh: no matches found...'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="myusuf3"
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="subl -w ~/.zshrc"
# alias ohmyzsh="subl -w ~/.oh-my-zsh"
# to give a directory an alias, you use hash. hash -d projs=~/projects/

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby zeus heroku rvm zsh-syntax-highlighting history-substring-search bundler)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

source $ZSH/oh-my-zsh.sh
# unsetopt correct_all
unsetopt correctall

# Customize to your needs...
export PATH=/usr/local/bin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/sbin:$PATH

# RVM
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# java for lego mindsorms
# export LEJOS_NXT_JAVA_HOME=/usr/lib/jvm/jdk1.7.0

export PATH=$PATH:~/sublime_text_3/
if hash subl 2>/dev/null; then
	export EDITOR="subl -w"
fi


# Fasd - fast jumping around
if hash fasd 2>/dev/null; then
	eval "$(fasd --init auto)"
fi

# alias youtube='~/Github/youtube-dl/youtube-dl -t' 
alias kb="setxkbmap us -variant colemak"
alias dotfiles="~/Dropbox/Misc/Github/dotfiles"
alias tp=trash-put # install trash-cli first
# alias rm=tp
# alias rm-real=rm
alias open=xdg-open
alias sicstus="rlwrap sicstus"
alias prolog=sicstus
alias mounti="sshfs pdk10@shell1.doc.ic.ac.uk:/homes/pdk10 ~/imperial"
alias mountrobot="sshfs pi@129.31.195.68:/home/pi ~/robot"
alias largestfiles="find -type f -ls | sort -k 7 -r -n | head |tr -s ' ' | cut -d' ' -f7,11,12,13,14,15,16,17,18,19"
alias pi="~dcw/tmp/git-clone-test/raspberry-pi-wifi/ssh-pi 80:1f:02:af:31:19"
alias picsh="bash -c 'export PERL5LIB=/homes/dcw/tmp/git-clone-test/raspberry-pi-wifi/PERSISTENT_TUPLES; ./scp-pi 80:1f:02:af:31:19'"

alias i3-lock="i3lock" # called from the i3-exit script
alias i3lock="i3lock -c 000000"

# Terminal 256 colors
export TERM="xterm-256color"

# Autocomplete man pages
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

# case-insensitive (uppercase from lowercase) completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# process completion
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# nices default completion style?
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Virutal Wrapper config for Django
# source /usr/local/bin/virtualenvwrapper.sh
# export WORKON_HOME=~/Envs 

# export PATH=$PATH:/home/pedro/Envs/grid/lib/python2.7/site-packages
# export PYTHONPATH="/home/pedro/Envs/grid/lib/python2.7/site-packages:$PYTHONPATH"

export PATH=$PATH:~/railsbricks
