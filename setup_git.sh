#!/bin/bash

git config --global color.ui true

git config --global core.editor vim
git config --global merge.tool vimdiff

if ! git config --global --list | grep -Fq "user.name"
then
    echo "Please enter a git user.name (default: leave empty):"
    read NAME
    if ! [[ $NAME = "" ]]; then
        git config --global user.name $NAME
    fi
fi

if ! git config --global --list | grep -Fq "user.email"
then
    echo "Please enter a git user.email (default: leave empty):"
    read EMAIL
    if ! [[ $EMAIL = "" ]]; then
        git config --global user.email $EMAIL
    fi
fi
