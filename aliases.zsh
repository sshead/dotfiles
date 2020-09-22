# Shortcuts and commands
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
# alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
# alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias vscode='code "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias hg="history | grep"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update_system='sudo softwareupdate -i -a'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias codedir="cd $HOME/Dev/code"
alias codecat="cd $HOME/Dev/code/catadmin/"
alias codepray="cd $HOME/Dev/code/pray-517/"

# Laravel
alias art="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"
alias tinker="php artisan tinker"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
# alias php74="docker run -it -w /data -v ${PWD}:/data:delegated --entrypoint php --rm registry.gitlab.com/grahamcampbell/php:7.4"
# alias php8="docker run -it -w /data -v ${PWD}:/data:delegated --entrypoint php --rm registry.gitlab.com/grahamcampbell/php:8.0"

# PHPUnit and Pest
alias pu='phpunit'
alias puf='phpunit --filter'
alias puslow='phpunit --group slow'
alias punoslow='phpunit --exclude-group slow'
alias pestf='pest --filter'
alias pestslow='pest --group slow'
alias pestnoslow='pest --exclude-group slow'

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

# MySQL (if installed)
alias sqlstart='brew services start mysql@5.7'
alias sqlstop='brew services stop mysql@5.7'
alias sql='mysql -uroot'

# Vagrant
alias v="vagrant global-status"
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vreload="vagrant reload"
alias vrebuild="vagrant destroy --force && vagrant up"

# Docker
# alias docker-composer="docker-compose"

# Git
# alias gs="git status"
# alias gb="git branch"
# alias gc="git checkout"
# alias gcb="git checkout -b"
# alias gl="git log --oneline --decorate --color"
# alias amend="git add . && git commit --amend --no-edit"
# alias commit="git add . && git commit -m"
# alias diff="git diff"
# alias force="git push --force"
# alias nuke="git clean -df && git reset --hard"
# alias pop="git stash pop"
# alias pull="git pull"
# alias push="git push"
# alias resolve="git add . && git commit --no-edit"
# alias stash="git stash -u"
# alias unstage="git restore --staged ."
# alias wip="commit wip"

# Set different iTerm2 profiles for SSH logins
function tabc() {
    NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi
    # if you have trouble with this, change
    # "Default" to the name of your default theme
    echo -e "\033]50;SetProfile=$NAME\a"
}

function tab-reset() {
    NAME="Default"
    echo -e "\033]50;SetProfile=$NAME\a"
}

function colorssh() {
    if [[ -n "$ITERM_SESSION_ID" ]]; then
        trap "tab-reset" INT EXIT
        if [[ "$*" =~ "moclam*" ]]; then
            tabc Catadmin
        else
            tabc
        fi
    fi
    ssh $*
}
compdef _ssh tabc=ssh

alias ssh="colorssh"
