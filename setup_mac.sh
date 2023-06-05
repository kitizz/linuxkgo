# Make sure code tools are installed.
xcode-select --install || true

# Install Homebrew if not already installed.
BREWBIN=$(which brew)
if [ -z $BREWBIN ]
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install the starship prompt.
HOMEBREW_NO_AUTO_UPDATE=1 brew install starship || true

# Load iTerm colors.
mkdir -p $HOME/Documents/iterm_settings
echo "Copying iTerm2 settings to $HOME/Documents/iterm_settings"
cp -i com.googlecode.iterm2.plist $HOME/Documents/iterm_settings/com.googlecode.iterm2.plist

# Install Oh-My-Zsh if not already installed.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

# Read Oh-my-zsh plugins from a specific file
sed -i '' -e 's/^plugins=.*/zmodload zsh\/mapfile;plugins=( "${(f)mapfile[myrc\/zsh_plugins]}" )/g' $HOME/.zshrc

# Add conda completions to plugins.
CONDA_COMPL_DIR = ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/conda-zsh-completion
if [ ! -d $CONDA_COMPL_DIR ]
then
    git clone https://github.com/esc/conda-zsh-completion $CONDA_COMPL_DIR
fi