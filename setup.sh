#!/bin/bash

echo "On Mac? (y/N):"
read input
export input="$(echo $input | tr '[:upper:]' '[:lower:]')"
if [ "$input" == "y" ]
then
    export sourceFile=$HOME/.profile
    export line=". \"\$HOME/.myrc/bashrcmac\""
else
    export sourceFile=$HOME/.bashrc
    export line=". \"\$HOME/.myrc/bashrc\""
fi

echo "Using source file, $sourceFile"

VIMBIN=$(which vim)
if [ -z $VIMBIN ]
then
    sudo apt-get install vim
fi
GITBIN=$(which git)
if [ -z $GITBIN ]
then
    sudo apt-get install git
fi

# Add a source to mybash if it doesn't exist yet
#export line=". \"\$HOME/.myrc/bashrc\""
if grep -Fxq "$line" "$sourceFile"
then
    echo "Line not added"
else
    echo $line >> $sourceFile
    echo "Line Added"
fi

# Put the files there
mkdir -p ~/.myrc
cp -rf myrc/. ~/.myrc/
cp -f inputrc ~/.inputrc

# Setup Vim
bash setupVim.sh
bash setupGit.sh

. $sourceFile

