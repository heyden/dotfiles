#!/usr/bin/env bash

which poetry &> /dev/null
if [ $? -eq 0 ]; then
    echo "Poetry is already installed."
    exit 0
fi

which pipx &> /dev/null
if [ $? -ne 0 ]; then
    echo "pipx is not installed. Please install pipx first."
    pip  install --user pipx
fi

pipx install poetry