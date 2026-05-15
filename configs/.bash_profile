# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

if [ "$BOOTSTRPED" != "1" ]; then
    source $HOME/dotfiles/bootstrap.sh

    . "$HOME/.cargo/env"
fi