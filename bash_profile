source ~/.profile

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:$PATH

export PATH=p~/.rbenv/bin:$PATH

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="/home/pedro/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
