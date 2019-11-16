#!/usr/bin/env bash

chmod 755 $HOME/dotfiles/scripts/*.sh

# install nvm if not installed
if [ ! -d "$HOME/.nvm" ] && ./$HOME/dotfiles/scripts/get_nvm.sh

# install pyenv if not installed
if [ ! -d "$HOME/.pyenv" ] && ./$HOME/dotfiles/scripts/get_pyenv.sh

# add bootstrap script to .zshrc
echo '[ -s "$HOME/dotfiles/env/bootstrap.sh" ] && \. $HOME/dotfiles/env/boostrap.sh' >> $HOME/.zshrc

