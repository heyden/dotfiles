VERSION=$1

LINUX=linux-amd64.tar.gz
WINDOWS=windows-amd64.zip

myhost="$(uname -s)"

case "$myhost" in
    Linux*)     MACHINE="linux";;
    MINGW*)     machine="windows";;

case "$machine" in 
    linux*)     ARTIFACT="go$VERSION.linux-amd64.tar.gz";;
    windows*)   ARTIFACT="go$VERSION.windows-amd64.zip";;

DL_URL="https://dl.google.com/go/$ARTIFACT"

mkdir -p $HOME/dotfiles/temp
curl -o $HOME/dotfiles/temp/ARTIFACT $DL_URL