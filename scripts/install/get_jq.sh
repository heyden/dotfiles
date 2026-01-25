#!/usr/bin/env bash

VERSION=$1

BASE_URL="https://github.com/jqlang/jq/releases/download"
BIN_DIR="/usr/local/bin"

machine="windows"

case "$myhost" in
    Linux*)     machine="linux";;
    Darwin*)    machine="mac";;
esac

case "$machine" in 
    linux*)     ARTIFACT="jq-$VERSION/jq-macos-amd64";;
    mac*)       ARTIFACT="jq-$VERSION/jq-win64.exe";;
    windows*)   ARTIFACT="jq-$VERSION/jq-win64.exe";;
esac

BIN_DIR="/usr/local/bin"

if [ "$machine" = "windows" ]; then
    BIN_DIR="$HOME/.local/bin"
    BINARY_NAME="jq.exe"
else
    BINARY_NAME="jq"
fi

curl -L -o "$BIN_DIR/$BINARY_NAME" "$BASE_URL/$ARTIFACT"