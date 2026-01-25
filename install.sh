#!/usr/bin/env bash

chmod 755 $HOME/dotfiles/scripts/*.sh

# install nvm if not installed
#if [ ! -d "$HOME/.nvm" ] && ./$HOME/dotfiles/scripts/install/get_nvm.sh

# install pyenv if not installed
#if [ ! -d "$HOME/.pyenv" ] && ./$HOME/dotfiles/scripts/install/get_pyenv.sh

#./$HOME/dotfiles/scripts/install/get_jq.sh

tooling=(
    
)

echo 'installing projects'
for tool in "${tooling[@]}"; do\
    echo "setting up $tool"
    ./scripts/install/install_$tool.sh
done

cp ./$HOME/dotfiles/configs/starship.toml $HOME/.config/starship.toml

# add bootstrap script to ~/.zshrc
echo '[ -f "~/dotfiles/bootstrap.sh" ] && \. ~/dotfiles/boostrap.sh' >> ~/.bash_profile