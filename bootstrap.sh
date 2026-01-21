machine="windows"

case "$myhost" in
    Linux*)     machine="linux";;
    Darwin*)    machine="mac";;
esac


if [ -f $HOME/dotfiles/env/vars ]; then
    source $HOME/dotfiles/env/vars
fi

if [ -f $HOME/dotfiles/env/aliases ]; then
    source $HOME/dotfiles/env/aliases
fi

if [ "$machine" = "linux" ] && [ -f $HOME/dotfiles/env/aliases_linux ]; then
    source $HOME/dotfiles/env/aliases_linux
elif [ "$machine" = "mac" ] && [ -f $HOME/dotfiles/env/aliases_mac ]; then
    source $HOME/dotfiles/env/aliases_mac
elif [ "$machine" = "windows" ] && [ -f $HOME/dotfiles/env/aliases_windows ]; then
    source $HOME/dotfiles/env/aliases_windows
fi  

if [ -f $HOME/dotfiles/env/functions ]; then
    source $HOME/dotfiles/env/functions
fi

if [ -f $HOME/dotfiles/env/secrets ]; then
    source $HOME/dotfiles/env/secrets
fi

# fzf config
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# starship
eval "$(starship init bash)"