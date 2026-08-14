#!/usr/bin/env bash
which starship &> /dev/null
if [ $? -eq 0 ]; then
    echo "Starship is already installed."
    exit 0
fi

curl -sS https://starship.rs/install.sh | sh