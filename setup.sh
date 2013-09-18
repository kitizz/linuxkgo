#!/bin/bash

# Add a source to mybash if it doesn't exist yet
export line="source ./.myrc/mybashrc"
if grep -Fxq "$line" ~/.profile
then
    echo  $line > ~/.profile
fi

# Put the files there
cp -rf myrc ~/.myrc

# Setup Vim
sh setupVim.sh
