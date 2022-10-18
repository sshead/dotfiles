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

SITES=$HOME/Sites

# CAT Admin
git clone git@bitbucket.org:aussieinchile/catadmin.git $SITES/catadmin/catadmin
git clone git@bitbucket.org:aussieinchile/catadmin.git/wiki $SITES/catadmin/wiki

# Prayer
git clone git@github.com:sshead/pray-517-vuejs.git $SITES/prayer/pray-517-vuejs
git clone git@github.com:sshead/pray-517-tall.git $SITES/prayer/pray-517-tall
git clone git@github.com:sshead/pray-517-laravel-7.git $SITES/prayer/pray-517-laravel-7
git clone git@github.com:sshead/prayer-vigil-517.git $SITES/prayer/prayer-vigil-517

# Personal
git clone git@github.com:sshead/dogfood-ratings.git $SITES/dogfood-ratings
