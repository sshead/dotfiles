#!/bin/sh

echo "Warning: About to clone repositories to your base sites directory."
read -p 'Do you want to proceed? [yes/no] ' proceed_clone

if [ "$proceed_clone" == "no" ]; then
	echo 'Aborted.'
	exit 0
elif [ "$proceed_clone" != "yes" ]; then
	echo "Invalid response - aborting."
    exit 1
fi

echo "Cloning repositories..."

SITES=$HOME/Dev/code

# CAT Admin
git clone git@bitbucket.org:aussieinchile/catadmin.git $SITES/catadmin

# Personal
git clone git@github.com:sshead/pray-517.git $SITES/pray-517
