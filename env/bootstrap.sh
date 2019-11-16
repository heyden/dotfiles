if [ -f "$HOME/dotfiles/env/vars" ]; then
    source "$HOME/dotfiles/env/vars"
fi

if [ -f "$HOME/dotfiles/env/aliases" ]; then
    source "$HOME/dotfiles/env/aliases"
fi

if [ -f "$HOME/dotfiles/env/functions" ]; then
    source "$HOME/dotfiles/env/functions"
fi

if [ -f "$HOME/dotfiles/env/secrets" ]; then
    source "$HOME/dotfiles/env/secrets"
fi