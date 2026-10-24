#!/usr/bin/env bash
set -e

# usage: get_node.sh 24.14.0
VERSION=${1#v}

if [ -z "$VERSION" ]; then
    echo "usage: $0 <version>  (e.g. $0 24.14.0)"
    exit 1
fi

myhost="$(uname -s)"
myarch="$(uname -m)"

machine="windows"

case "$myhost" in
    Linux*)     machine="linux";;
    Darwin*)    machine="mac";;
esac

case "$myarch" in
    arm64*|aarch64*)    arch="arm64";;
    *)                  arch="x64";;
esac

case "$machine" in
    linux*)     NAME="node-v$VERSION-linux-$arch"; ARTIFACT="$NAME.tar.gz";;
    mac*)       NAME="node-v$VERSION-darwin-$arch"; ARTIFACT="$NAME.tar.gz";;
    windows*)   NAME="node-v$VERSION-win-$arch"; ARTIFACT="$NAME.zip";;
esac

DL_URL="https://nodejs.org/dist/v$VERSION/$ARTIFACT"

echo "Downloading Node $VERSION for $machine from $DL_URL"

install_dir="$HOME/software/nodejs"

if [ ! -d "$install_dir" ]; then
    echo "Creating install directory at $install_dir"
    mkdir -p $install_dir
fi

temp_dir=$HOME/dotfiles/temp
mkdir -p $temp_dir
curl -fL -o $temp_dir/$ARTIFACT $DL_URL
curl -fsL -o $temp_dir/SHASUMS256.txt https://nodejs.org/dist/v$VERSION/SHASUMS256.txt

echo "verifying checksum"
if [ "$machine" = "mac" ]; then
    (cd $temp_dir && grep " $ARTIFACT\$" SHASUMS256.txt | shasum -a 256 -c -)
else
    (cd $temp_dir && grep " $ARTIFACT\$" SHASUMS256.txt | sha256sum -c -)
fi

echo "extracting $ARTIFACT"
if [ "$machine" = "windows" ]; then
    unzip -q $temp_dir/$ARTIFACT -d $temp_dir/
else
    tar -xzf $temp_dir/$ARTIFACT -C $temp_dir/
fi

echo "installing to $install_dir/$NAME"
rm -rf $install_dir/$NAME
mv $temp_dir/$NAME $install_dir/
rm -rf $temp_dir

if [ "$machine" = "windows" ]; then
    $install_dir/$NAME/node.exe --version
else
    $install_dir/$NAME/bin/node --version
fi

echo "to use this version, set in env/vars:"
echo "    export NODE_HOME=\"\$HOME/software/nodejs/$NAME\""
