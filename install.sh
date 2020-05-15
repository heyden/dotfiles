#!/usr/bin/env bash

chmod 755 $HOME/dotfiles/scripts/*.sh

chsh -s $(which zsh)

# install oh-my-zsh
if [ ! -f "$HOME/.zshrc" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install nvm if not installed
if [ ! -d "$HOME/.nvm" ] && ./$HOME/dotfiles/scripts/get_nvm.sh

# install pyenv if not installed
if [ ! -d "$HOME/.pyenv" ] && ./$HOME/dotfiles/scripts/get_pyenv.sh

tooling=(
    vim
    zsh
)

echo 'installing projects'
for tool in "${tooling[@]}"; do\
    echo "setting up $tooling"
    ./$tool/install.sh
done

# add bootstrap script to ~/.zshrc
echo '[ -f "~/dotfiles/env/bootstrap.sh" ] && \. ~/dotfiles/env/boostrap.sh' >> ~/.zshrc