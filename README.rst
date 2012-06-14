Pedro's Dot Files
=======================

Modeled after Mhadi Ysuf's Dot files: https://github.com/myusuf3/dotfiles

These are my configs and setup a system the way I like it.


Installation
=============

All you do right now is run the install.sh script in the root directory.


Guide
=====

http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/


ZSH
- https://github.com/robbyrussell/oh-my-zsh

- https://github.com/zsh-users/zsh-syntax-highlighting  (fish-like syntax highlighting)

  Download the script or clone this repository in oh-my-zsh plugins directory:

  cd ~/.oh-my-zsh/custom/plugins
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
  Activate the plugin in ~/.zshrc (in last position):

  plugins=( [plugins...] zsh-syntax-highlighting)
  Source ~/.zshrc to take changes into account:

  source ~/.zshrc
