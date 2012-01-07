#!/bin/sh

. ./install-functions.sh

echo "-= Install dotfiles. =-"

DOTFILES="$HOME/dotfiles"

export DOTFILES

echo "\n-= Clone dotfiles repository. =-"
git clone git@github.com:dsjbirch/dotfiles.git $DOTFILES

echo "\n-= Create directory structure. =-"
mkdir -p $HOME/etc

echo "\n-= Create symlinks. =-"
link 'bash-dotfiles/bash_logout' '.bash_logout'
link 'bash-dotfiles/bash_profile' '.bash_profile'
link 'bash-dotfiles/bashrc' '.bashrc'
link 'bash-dotfiles/inputrc' '.inputrc'
link 'bash-dotfiles/prompt' '.prompt'

link 'rails-templates' 'etc/rails-templates'

link 'aliases' '.aliases'
link 'environ' '.environ'
link 'functions' '.functions'
link 'profile' '.profile'
link 'screenrc' '.screenrc'

echo "\n-= Update $DOTFILES submodules. =-"
cd $DOTFILES
git submodule init
git submodule update

# # GIT
# link_repo_file_to_home_file 'git/gitconfig' '.gitconfig'
# 
# # SHELL
# link_repo_file_to_home_file "shell/profile" ".profile"
# 
# # BASH 
# link_repo_file_to_home_file 'shell/bash/bashrc' '.bashrc'
# link_repo_file_to_home_file 'shell/bash/bash_profile' '.bash_profile'
