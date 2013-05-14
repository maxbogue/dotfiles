#!/usr/bin/env sh

dotfiles="$HOME/.dotfiles"

files="aliases gitconfig gitignore gvimrc ssh tmux.conf tmux-powerlinerc vim vimrc zshrc"

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

# Copy the boxprefs file.
if  [ ! -e "$HOME/.boxprefs" ]; then
    echo "Copying example boxprefs file to ~/.boxprefs"
    cp $dotfiles/boxprefs $HOME/.boxprefs
fi

# Fix ssh permissions.
if [ "`ls -ld $dotfiles/ssh | awk '{print $1}'`" != "drwx------" ]; then
    echo "Fixing ssh file permissions."
    chmod 700 $dotfiles/ssh
    chmod 600 $dotfiles/ssh/authorized_keys
    chmod 644 $dotfiles/ssh/*.pub
fi
