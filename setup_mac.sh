# Make sure code tools are installed.
xcode-select --install || true

# Install Homebrew if not already installed.
BREWBIN=$(which brew)
if [ -z $BREWBIN ]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Load iTerm colors.
mkdir -p $HOME/Documents/iterm_settings
echo "Copying iTerm2 settings to $HOME/Documents/iterm_settings"
cp -i com.googlecode.iterm2.plist $HOME/Documents/iterm_settings/com.googlecode.iterm2.plist

# Install Oh-My-Zsh if not already installed.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true