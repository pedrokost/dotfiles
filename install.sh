#!/usr/bin/env bash

echo "initializing submodules"
git submodule init
git submodule update

echo "Deleting the old files"
rm ~/.zshrc
rm ~/.bashrc
rm ~/.gitconfig
rm ~/.gitignore
rm ~/.tmux.conf
rm ~/.gemrc
rm ~/.bash_profile
rm ~/oh-my-zsh/themes/myusuf3.zsh-theme

echo "Symlinking files"
ln -s ~/Documents/Dropbox/Misc/dev/dotfiles/zshrc ~/.zshrc
ln -s ~/Documents/Dropbox/Misc/dev/dotfiles/bashrc ~/.bashrc
ln -s ~/Documents/Dropbox/Misc/dev/dotfiles/gitconfig ~/.gitconfig
ln -s ~/Documents/Dropbox/Misc/dev/dotfiles/gitignore ~/.gitignore
ln -s ~/Documents/Dropbox/Misc/dev/dotfiles/tmux ~/.tmux.conf
ln -s ~/Documents/Dropbox/Misc/dev/dotfiles/gemrc ~/.gemrc
ln -s ~/Documents/Dropbox/Misc/dev/dotfiles/bash_profile ~/.bash_profile
ln -s ~/Documents/Dropbox/Misc/dev/dotfiles/myusuf3.zsh-theme ~/.oh-my-zsh/themes/myusuf3.zsh-theme

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "All done."

