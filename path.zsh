# Load dotfiles binaries
export PATH="$DOTFILES/bin:$PATH"

# export PATH="/usr/local/opt/gettext/bin:$PATH"
#export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Python scripts
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# PHP Monitor helper binaries
export PATH="$HOME/.config/phpmon/bin:$PATH"

# Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
