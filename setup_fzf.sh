echo -e "\nSetting up fzf..."

HOMEBREW=$(which brew)
if [ -z $HOMEBREW ]; then
    echo -e "\nInstalling fzf via apt"
    sudo apt install fzf
else
    echo -e "\nInstalling fzf via homebrew"
    brew install fzf
    $(brew --prefix)/opt/fzf/install
fi
