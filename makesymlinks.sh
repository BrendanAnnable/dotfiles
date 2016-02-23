#!/bin/bash

# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

dir="$HOME/dotfiles"
olddir="$HOME/dotfiles/old"
files="bash_profile gitignore_global zpreztorc zshrc gitconfig ideavimrc vimrc zprofile ackrc"

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p "$olddir"
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd "$dir"
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from $HOME to $olddir"
    mv "$HOME/.$file" "$olddir/"
    echo "Creating symlink to $file in home directory."
    ln -s "$dir/$file" "$HOME/.$file"
done

