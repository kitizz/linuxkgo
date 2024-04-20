echo -e "\nSetting up fzf..."

HOMEBREW=$(which brew)
if [ -z $HOMEBREW ]; then
    echo "Installing fzf via apt"
    sudo apt install fzf
else
    echo "Installing fzf via homebrew"
    HOMEBREW_NO_AUTO_UPDATE=1 brew install fzf
fi
