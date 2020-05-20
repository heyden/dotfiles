#!/usr/bin/env bash

echo 'vim: removing existing dirs'
case "$OSTYPE" in
    darwin*)
        rm -rf ~/.vim
        rm -rf ~/.vimrc
        ;;
    linux*)
        rm -rf ~/.vim
        rm -rf ~/.vimrc
        ;;
    msys*)    
        rm -rf ~/.vimfiles
        rm -rf ~/.vimrc
        ;;
esac

# Plugins
# TODO - replace with git submodules
if [ ! -d ~/dotfiles/vim/vim/pack/plugins/start/solarized ]; then
    echo 'vim: installing solarized'
    git clone git://github.com/altercation/vim-colors-solarized.git ~/dotfiles/vim/vim/pack/plugins/start/solarized
fi

if [ ! -d ~/dotfiles/vim/vim/pack/plugins/start/ale ]; then
    echo 'vim: installing vim-go'
    git clone https://github.com/dense-analysis/ale.git ~/dotfiles/vim/vim/pack/plugins/start/ale
fi

if [ ! -d ~/dotfiles/vim/vim/pack/plugins/start/fzf ]; then
    echo 'vim: installing fzf'
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/dotfiles/vim/vim/pack/plugins/start/fzf
    ~/dotfiles/vim/vim/pack/plugins/start/fzf/install
fi

if [ ! -d ~/dotfiles/vim/vim/pack/plugins/start/typescript-vim ]; then
    echo 'vim: installing vim-go'
    git clone https://github.com/leafgarland/typescript-vim.git ~/dotfiles/vim/vim/pack/plugins/start/typescript-vim
fi

if [ ! -d ~/dotfiles/vim/vim/pack/plugins/start/vim-go ]; then
    echo 'vim: installing vim-go'
    git clone https://github.com/fatih/vim-go.git ~/dotfiles/vim/vim/pack/plugins/start/vim-go
fi

echo 'vim: symlinking'
ln -s ~/dotfiles/vim/vimrc ~/.vimrc

case "$OSTYPE" in
    darwin*)  ln -s ~/dotfiles/vim/vim ~/.vim ;;
    linux*)   ln -s ~/dotfiles/vim/vim ~/.vim ;;
    msys*)    ln -s ~/dotfiles/vim/vim ~/.vimfiles ;;
esac