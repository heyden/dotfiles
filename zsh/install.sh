#!/usr/bin/env bash

rm -rf ~/.zshrc
rm -rf ~/.zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -s ~/dotfiles/zsh/zshrc ~/.zshrc