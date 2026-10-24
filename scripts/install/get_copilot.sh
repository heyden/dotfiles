#!/usr/bin/env bash
which copilot &> /dev/null
if [ $? -eq 0 ]; then
    echo "Copilot is already installed."
    exit 0
fi

curl -fsSL https://gh.io/copilot-install | bash