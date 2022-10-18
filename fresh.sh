#!/bin/sh

echo "Warning: About to set up your Mac. This should only be done on a fresh machine."
read -p 'Are you SURE want to proceed? [yes/no] ' proceed_setup

if [ "$proceed_setup" == "no" ]; then
	echo 'Aborted.'
	exit 0
elif [ "$proceed_setup" != "yes" ]; then
	echo "Invalid response - aborting."
    exit 1
fi

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# Set up DDEV-local and NFS
# EDIT: Now using Takeout by Tighten (https://github.com/tighten/takeout)
#mkcert -install
#curl -O https://raw.githubusercontent.com/drud/ddev/master/scripts/macos_ddev_nfs_setup.sh && chmod +x macos_ddev_nfs_setup.sh && ./macos_ddev_nfs_setup.sh
#ddev config global --nfs-mount-enabled

# Set default MySQL root password and auth type.
# mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
pecl install memcached # imagick redis swoole

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet laravel/envoy beyondcode/expose tightenco/takeout

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Install global Node packages
npm install -g npm-check-updates

# Create a Sites directory
mkdir $HOME/Sites

# Create sites subdirectories
mkdir $HOME/Sites/catadmin
mkdir $HOME/Sites/prayer

# Create directory for non-web code projects
mkdir $HOME/Dev/code

# Clone Github repositories
$DOTFILES/clone.sh

# Create symlinks
./links.sh

# Set macOS preferences - we will run this last because this will reload the shell
source $DOTFILES/.macos

# Caveats
# cat <<DELIM
# Caveats:
# * NFS (for DDEV / Docker) has been set up for your entire home directory.
#   If you want to limit it, choose a more limited subdirectory by running:
#     sudo vi /etc/exports
#   and then
#     sudo nfsd restart
# DELIM
