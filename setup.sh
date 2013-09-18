#!/bin/bash

# Add a source to mybash if it doesn't exist yet
export line=". \"\$HOME/.myrc/mybashrc\""
if grep -Fxq "$line" ~/.profile
then
    echo "Line not added"
else
    echo $line >> ~/.profile
    echo "Line Added"
fi

# Put the files there
mkdir -p ~/.myrc
cp -rf myrc/. ~/.myrc/

# Setup Vim
bash setupVim.sh
bash setupGit.sh

. ~/.profile

