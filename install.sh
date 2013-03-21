#!/usr/bin/env bash

scriptdir="`pwd`"

echo "initializing submodules"
git submodule init
git submodule update

echo "Downloading and installing oh-my-zsh"
wget --quiet --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

echo "Downloading fasd"
git clone --quiet https://github.com/clvv/fasd.git

echo "Installing fasd"
cd fasd
make install --quiet
cd ..
rm -r fasd/

echo "Deleting the old files"
rm ~/.zshrc
rm ~/.bashrc
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.tmux.conf
rm ~/.gemrc
rm ~/.bash_profile

echo "Symlinking files"
ln -s $scriptdir/zshrc ~/.zshrc
ln -s $scriptdir/bashrc ~/.bashrc
ln -s $scriptdir/gitconfig ~/.gitconfig
ln -s $scriptdir/gitignore ~/.gitignore
ln -s $scriptdir/tmux ~/.tmux.conf
ln -s $scriptdir/gemrc ~/.gemrc
ln -s $scriptdir/bash_profile ~/.bash_profile

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "All done."

