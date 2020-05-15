#!/usr/bin/env bash

echo 'vim: removing existing dirs'
rm -rf ~/.vimrc
rm -rf ~/.vim

# Plugins
# TODO - replace with git submodules
if [ ! -d ~/dotfiles/vim/vim/pack/plugins/start/vim-go ]; then
    echo 'vim: installing vim-go'
    git clone https://github.com/fatih/vim-go.git ~/dotfiles/vim/vim/pack/plugins/start/vim-go
fi

if [ ! -d ~/dotfiles/vim/vim/pack/plugins/start/fzf ]; then
    echo 'vim: installing fzf'
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/dotfiles/vim/vim/pack/plugins/start/fzf
    ~/dotfiles/vim/vim/pack/plugins/start/fzf/install
fi

if [ ! -d ~/dotfiles/vim/vim/pack/plugins/start/solarized ]; then
    echo 'vim: installing solarized'
    git clone git://github.com/altercation/vim-colors-solarized.git ~/dotfiles/vim/vim/pack/plugins/start/solarized
fi

echo 'vim: symlinking'
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/vim/vim ~/.vim
