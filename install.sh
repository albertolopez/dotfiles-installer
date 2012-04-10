#!/bin/sh

. ./install-functions.sh

echo "-= Install dotfiles. =-"

DOTFILES="$HOME/.dotfiles"

export DOTFILES

echo "\n-= Clone dotfiles repository. =-"
git clone git@github.com:albertolopez/dotfiles.git $DOTFILES

echo "\n-= Create symlinks. =-"
for f in $DOTFILES
do
link "$DOTFILES/$f" "$HOME/$f"
done

echo "\n-= Update $DOTFILES submodules. =-"
cd $DOTFILES
git submodule init
git submodule update
