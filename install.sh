#!/usr/bin/env bash

chmod 755 $HOME/dotfiles/scripts/*.sh

# install nvm if not installed
if [ ! -d "$HOME/.nvm" ] && ./$HOME/dotfiles/scripts/install/get_nvm.sh

# install pyenv if not installed
if [ ! -d "$HOME/.pyenv" ] && ./$HOME/dotfiles/scripts/install/get_pyenv.sh

tooling=(
    vim
    zsh
)

echo 'installing projects'
for tool in "${tooling[@]}"; do\
    echo "setting up $tool"
    ./$tool/install.sh
done

# add bootstrap script to ~/.zshrc
echo '[ -f "~/dotfiles/env/bootstrap.sh" ] && \. ~/dotfiles/env/boostrap.sh' >> ~/.zshrc

# set zsh as shell
echo 'changing shell to zsh'
chsh -s $(which zsh)