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
mv ~/.zshrc ~/.zshrc_old
mv ~/.bashrc ~/.bashrc_old
mv ~/.gitconfig ~/.gitconfig_old
mv ~/.gitignore ~/.gitignore_old
mv ~/.tmux.conf ~/.tmux.conf_old
mv ~/.gemrc ~/.gemrc_old
mv ~/.bash_profile ~/.bash_profile_old
mv ~/.config/i3/config ~/.config/i3/config_old
mv ~/.config/i3/status ~/.config/i3/status_old

echo "Symlinking files"
ln -s $scriptdir/zshrc ~/.zshrc
ln -s $scriptdir/bashrc ~/.bashrc
ln -s $scriptdir/gitconfig ~/.gitconfig
ln -s $scriptdir/gitignore ~/.gitignore
ln -s $scriptdir/tmux ~/.tmux.conf
ln -s $scriptdir/gemrc ~/.gemrc
ln -s $scriptdir/bash_profile ~/.bash_profile
mkdir ~/.config/{i3,i3status}
ln -s $scriptdir/i3config ~/.config/i3/config
ln -s $scriptdir/i3status ~/.config/i3status/config

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "All done."

