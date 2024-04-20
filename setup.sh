#!/bin/bash


if [[ $OSTYPE == 'darwin'* ]]
then
    export bashSourceFile=$HOME/.profile
    export line='. "$HOME/.myrc/bashrcmac"'

    bash setup_mac.sh
else
    export bashSourceFile=$HOME/.bashrc
    export line='. "$HOME/.myrc/bashrc"'

    bash setup_debian.sh
fi

echo -e "\nUsing bash source file, $bashSourceFile"
# Add a source to mybash if it doesn't exist yet
#export line=". \"\$HOME/.myrc/bashrc\""
if grep -Fxq "$line" "$bashSourceFile"
then
    echo "Bashrc source line not added"
else
    echo $line >> $bashSourceFile
    echo "Line Added"
fi

export zshSourceFile=$HOME/.zshrc
export zshLine='source "$HOME/.myrc/zshrc"'
echo -e "\nUsing zsh source file, $zshSourceFile"
# Add a source to my zshrc if it doesn't exist yet
#export line="source \"\$HOME/.myrc/zshrc\""
if grep -Fxq "$zshLine" "$zshSourceFile"
then
    echo "ZSH source line not added"
else
    echo $zshLine >> $zshSourceFile
    echo "Line Added"
fi

# Put the files there
if [ ! -d $HOME/.myrc ]
then
    ln -sf $PWD/myrc $HOME/.myrc
fi
cp -f inputrc ~/.inputrc

# Setup Vim
bash setup_vim.sh
bash setup_git.sh
bash setup_zellij.sh
bash setup_fzf.sh

. $bashSourceFile

