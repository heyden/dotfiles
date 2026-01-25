machine="windows"

case "$(uname)" in
    Linux*)     machine="linux";;
    Darwin*)    machine="mac";;
esac

# source common vars
if [ -f $HOME/dotfiles/env/vars ]; then
    source $HOME/dotfiles/env/vars
fi

# source common aliases
if [ -f $HOME/dotfiles/env/aliases ]; then
    source $HOME/dotfiles/env/aliases
fi

# source common functions
if [ -f $HOME/dotfiles/env/functions ]; then
    source $HOME/dotfiles/env/functions
fi

# source machine specific env
if [ "$machine" == "linux" ] && [ -f $HOME/dotfiles/env/linux/env ]; then
    source $HOME/dotfiles/env/linux/env
elif [ "$machine" == "mac" ] && [ -f $HOME/dotfiles/env/mac/env ]; then
    source $HOME/dotfiles/env/mac/env
elif [ "$machine" == "windows" ] && [ -f $HOME/dotfiles/env/windows/env ]; then
    source $HOME/dotfiles/env/windows/env
fi

# check if we are in silverblue
# /etc/os-release contains VARIANT="Silverlue"
[ "$(grep 'VARIANT="Silverblue"' /etc/os-release)" != "" ] && source $HOME/dotfiles/env/silverblue/env

# source common secrets
if [ -f $HOME/dotfiles/env/secrets ]; then
    source $HOME/dotfiles/env/secrets
fi

# fzf config
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# starship
eval "$(starship init bash)"