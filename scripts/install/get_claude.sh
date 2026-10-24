#!/usr/bin/env bash

which claude &> /dev/null
if [ $? -eq 0 ]; then
    echo "Claude is already installed."
    exit 0
fi

curl -fsSL https://claude.ai/install.sh | bash