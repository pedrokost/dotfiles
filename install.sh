#!/usr/bin/env bash

scriptdir="`pwd`"

cd
homedir="`pwd`"
cd "$scriptdir"

echo "initializing submodules"
git submodule init
git submodule update

echo "Downloading and installing oh-my-zsh"
wget --quiet --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh


if ! [ "$(exists fasd)" -eq 1 ]
then
	echo "Downloading fasd"
	git clone --quiet https://github.com/clvv/fasd.git

	echo "Setting up FASD - a command-line productivity booster"
	cd fasd
	make install --quiet
	cd ..
	rm -r fasd/
fi


# rclocal=$(cat <<'END_HEREDOC'
# #!/bin/sh -e
# #
# # rc.local
# #
# # This script is executed at the end of each multiuser runlevel.
# # Make sure that the script will "exit 0" on success or any other
# # value on error.
# #
# # In order to enable or disable this script just change the execution
# # bits.
# #
# # By default this script does nothing.

# chown pedro:users /sys/class/backlight/radeon_bl0/brightness

# exit 0
# END_HEREDOC
# )

# echo "$rclocal"

# if [ "$(exists i3)" -eq 1 ]
# then
echo "Setting up the screen brightness script"
ln -s $scriptdir/brightness.sh $homedir/.i3/brightness

# 	sudo mv /etc/rc.local /etc/rc.local_old
# 	sudo sed -i -e '$i chown pedro:users /sys/class/backlight/radeon_bl0/brightness\n' "/etc/rc.local"
# 	# bash -c "echo "$rclocal" > "/etc/rc.local""
# fi

echo "Deleting the old files"
mv ~/.zshrc ~/.zshrc_old
mv ~/.bashrc ~/.bashrc_old
mv ~/.gitconfig ~/.gitconfig_old
mv ~/.gitignore ~/.gitignore_old
mv ~/.tmux.conf ~/.tmux.conf_old
mv ~/.gemrc ~/.gemrc_old
mv ~/.bash_profile ~/.bash_profile_old
mv ~/.i3/config ~/.i3/config_old
mv ~/.config/i3status/config ~/.config/i3status/config_old

echo "Symlinking files"
ln -s $scriptdir/zshrc ~/.zshrc
ln -s $scriptdir/bashrc ~/.bashrc
ln -s $scriptdir/gitconfig ~/.gitconfig
ln -s $scriptdir/gitignore ~/.gitignore
ln -s $scriptdir/tmux ~/.tmux.conf
ln -s $scriptdir/gemrc ~/.gemrc
ln -s $scriptdir/bash_profile ~/.bash_profile
mkdir ~/.i3/
mkdir ~/.config/i3status/
ln -s $scriptdir/i3config ~/.i3/config
ln -s $scriptdir/i3status ~/.config/i3status/config

echo "Updating submodules"
git submodule foreach git pull origin master --recurse-submodules

echo "All done."

