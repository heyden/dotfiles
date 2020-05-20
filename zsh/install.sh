#!/usr/bin/env bash

case "$OSTYPE" in
    msys*) echo "windows not supported" && exit 0
esac

rm -rf ~/.zshrc
rm -rf ~/.zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -s ~/dotfiles/zsh/zshrc ~/.zshrc