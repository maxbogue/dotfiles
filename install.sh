#!/usr/bin/env sh

dotfiles="$HOME/.dotfiles"

files="aliases gitconfig gitignore gvimrc ssh tmux.conf tmux-powerlinerc vim vimrc zshrc"

dotfiles_backup () {
    if [ -L "$1" ]; then
        echo "Removing existing symlink $1"
        rm $1
    elif [ -e "$1" ]; then
        echo "Existing $1 found; moving to $1.bak"
        mv $1 $1.bak
    fi
}

dotfiles_link () {
    echo "Linking $2 to $1"
    ln -s $1 $2
}

# Backup existing dotfiles.
for f in $files; do
    p=$HOME/.$f
    dotfiles_backup $p
done
dotfiles_backup $HOME/.irssi/config

# Create symlinks.
for f in $files; do
    dotfiles_link $dotfiles/$f $HOME/.$f
done
mkdir -p $HOME/.irssi
dotfiles_link $dotfiles/irssi $HOME/.irssi/config

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
