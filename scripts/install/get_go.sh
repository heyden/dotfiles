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

echo "Downloading Go $VERSION for $machine from $DL_URL"

install_dir="$HOME/go"

if [ "$machine" = "windows" ]; then
    install_dir="/c/go"
fi

if [ ! -d "$install_dir" ]; then
    echo "Creating install directory at $install_dir"
    mkdir -p $install_dir
fi

mkdir -p $HOME/dotfiles/temp
curl -o $HOME/dotfiles/temp/$ARTIFACT $DL_URL


echo "extracting $ARTIFACT"
if [ "$machine" = "windows" ]; then
    echo "extracting zip for windows"
    unzip -q $HOME/dotfiles/temp/$ARTIFACT -d $HOME/dotfiles/temp/
else
    tar -xzf $HOME/dotfiles/temp/$ARTIFACT -C $HOME/dotfiles/temp/
    echo "extracting for $machine is not yet implemented"
fi

echo "installing to $install_dir/go"
rm -rf $install_dir/go
mv $HOME/dotfiles/temp/go/* $install_dir
rm -rf $HOME/dotfiles/temp

go version