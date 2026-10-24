#!/usr/bin/env bash

set -eu

INSTALLPATH=${INSTALLPATH:-/usr/local/bin}

#curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

OS=$(uname -s)
arch=$(uname -m)
cli_arch=""
case $OS in
    CYGWIN* | MINGW64*)
        OS=windows
        cli_arch=amd64
        ;;
    Darwin | Linux | FreeBSD)
        case $arch in
        x86_64)
            cli_arch=amd64
            ;;
        armv8*)
            cli_arch=arm64
            ;;
        aarch64*)
            cli_arch=arm64
            ;;
        *)
            echo "Unsupported architecture: ${arch}" >&2
            exit 1
            ;;
        esac
        ;;
    *)
        echo "Unsupported OS: ${OS}" >&2
        exit 1
        ;;
esac


dstfile="${INSTALLPATH}/kubectl"
tmpdir=$(mktemp -d /tmp/kubectl.XXXXXX)

stable=$(curl -L -s https://dl.k8s.io/release/stable.txt)
url="https://dl.k8s.io/release/${stable}/bin/${OS,,}/${cli_arch}/kubectl"

echo "Downloading kubectl from ${url}..."
cd "${tmpdir}"
curl -fLO "${url}"

echo "Installing kubectl to ${dstfile}..."
