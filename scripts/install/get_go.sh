#!/usr/bin/env bash
VERSION=$1

myhost="$(uname -s)"

machine="windows"

case "$myhost" in
    Linux*)     machine="linux";;
    Darwin*)    machine="mac";;
esac

case "$machine" in 
    linux*)     ARTIFACT="go$VERSION.linux-amd64.tar.gz";;
    mac*)       ARTIFACT="go$VERSION.darwin-amd64.tar.gz";;
    windows*)   ARTIFACT="go$VERSION.windows-amd64.zip";;
esac

DL_URL="https://dl.google.com/go/$ARTIFACT"

mkdir -p $HOME/dotfiles/temp
curl -o $HOME/dotfiles/temp/$ARTIFACT $DL_URL

tar -xvf $HOME/dotfiles/temp/$ARTIFACT
mv $HOME/dotfiles/temp/go/. $HOME/go/.
rm -f $HOME/dotfiles/temp