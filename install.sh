#!/usr/bin/env bash

scriptdir="`pwd`"

cd
homedir="`pwd`"
cd "$scriptdir"

function exists() {
	if command -v "$1" >/dev/null 2>&1;
	then
		echo 1
	else
		echo 0
	fi
}

# echo "initializing submodules"
# git submodule init
# git submodule update

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
if [ "$(exists i3)" -eq 1 ]
then
	mv ~/.i3/config ~/.i3/config_old
	# mv ~/.config/i3status/config ~/.config/i3status/config_old
	
	mkdir ~/.i3/ 2>/dev/null
	# mkdir ~/.config/i3status/ 2>/dev/null
	ln -s $scriptdir/i3config ~/.i3/config
	# ln -s $scriptdir/i3status ~/.config/i3status/config


	# Nautilus shouldn\'t open a desktop window
	gsettings set org.gnome.desktop.background show-desktop-icons false
fi


echo "Deleting the old files"
mv ~/.zshrc ~/.zshrc_old
mv ~/.zpreztorc ~/.zpreztorc_old
mv ~/.zprezto/modules/prompt/functions/prompt_josh_setup ~/.zprezto/modules/prompt/functions/prompt_josh_setup_old
mv ~/.bashrc ~/.bashrc_old
mv ~/.gitconfig ~/.gitconfig_old
mv ~/.gitignore ~/.gitignore_old
mv ~/.gemrc ~/.gemrc_old
mv ~/.bash_profile ~/.bash_profile_old

echo "Symlinking files"
ln -s $scriptdir/zshrc ~/.zshrc
ln -s $scriptdir/zpreztorc ~/.zpreztorc
mkdir -p ~/.zprezto/modules/prompt/functions
ln -s $scriptdir/prompt_josh_setup ~/.zprezto/modules/prompt/functions/prompt_josh_setup
cp $scriptdir/gitconfig ~/.gitconfig
ln -s $scriptdir/gitignore ~/.gitignore
ln -s $scriptdir/gemrc ~/.gemrc
ln -s $scriptdir/bash_profile ~/.bash_profile
ln -s $scriptdir/isxlab.sh /usr/local/bin/isxlab
ln -s $scriptdir/isnotxlab.sh /usr/local/bin/isnotxlab
ln -s $scriptdir/execonce.sh /usr/local/bin/execonce
ln -s $scriptdir/i3exit.sh /usr/local/bin/i3exit
mkdir -p ~/.config/dunst
ln -s $scriptdir/dunstrc ~/.config/dunst/dunstrc
ln -s $scriptdir/dunst_espeak.sh ~/.config/dunst/dunst_espeak.sh
# sudo chmod +x ~/.config/dunst/dunst_espeak.sh
ln -s $scriptdir/gotosleep_espeak.sh ~/.config/dunst/gotosleep_espeak.sh
ln -s $scriptdir/polybar.sh ~/.config/polybar/polybar.sh
ln -s $scriptdir/polybar_config ~/.config/polybar/config
chmod +x ~/.config/polybar/polybar.sh

# git clone https://github.com/x70b1/polybar-scripts.git
# mv polybar-scripts/* ~/.config/polybar/
# https://github.com/x70b1/polybar-scripts/tree/master/polybar-scripts/battery-combined-udev
# https://github.com/x70b1/polybar-scripts/tree/master/polybar-scripts/info-ssh-sessions


echo "Prepare executables"
#chmod +x /usr/local/bin

echo "Configuring git"
read -p "	-> What is your name?" gitName
git config --global user.name "$gitName"
read -p "  -> What is your email?" gitEmail
git config --global user.email "$gitEmail"

if [ "$(exists subl)" -eq 1 ]
then
	echo "Setting up sublime text preferences"
	# This is if there is no propietary graphics installed TODO automatic check
	unlink $homedir/.config/sublime-text-3
	mv $homedir/.config/sublime-text-3 $homedir/.config/sublime-text-3.old
	ln -s $scriptdir/../sublime-text-3 $homedir/.config/sublime-text-3
fi

# echo "Updating submodules"
# git submodule foreach git pull origin master --recurse-submodules

echo "All done."

