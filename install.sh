#!/usr/bin/env sh

dotfiles="$HOME/.dotfiles"

lnif() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
}

files="aliases gitconfig gitignore gvimrc oh-my-zsh ssh vim vimrc zshrc"

# Backup existing dotfiles.
for f in $files; do
    p=$HOME/.$f
    if [ -L "$p" ]; then
        echo "Removing existing symlink $p"
        rm $p
    elif [ -e "$p" ]; then
        echo "Existing $f found; moving to $p.bak"
        mv $p $p.bak
    fi
done

# Create symlinks.
for f in $files; do
    source=$dotfiles/$f
    dest=$HOME/.$f
    echo "Linking $dest to $source"
    ln -s $source $dest
done
