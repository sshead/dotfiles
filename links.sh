#!/bin/sh

echo "Creating symlinks..."

homedir=$HOME

# dotfiles directory
dotfiledir=${homedir}/.dotfiles

# list of files/folders to symlink in ${homedir}
files="gitignore_global mackup.cfg"

# change to the dotfiles directory
cd ${dotfiledir}

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Download Git Auto-Completion
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" > ${homedir}/.git-completion.bash

# Set global Git ignore
git config --global core.excludesfile ${homedir}/.gitignore_global
