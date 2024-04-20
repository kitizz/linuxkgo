# Make sure code tools are installed.
xcode-select --install || true
echo ""

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
DEST_ITERM=$HOME/Documents/iterm_settings/com.googlecode.iterm2.plist
ADDED_ITERM_LINES=$(diff -u com.googlecode.iterm2.plist $DEST_ITERM | grep -E "^\+" | wc -l)
REMOVED_ITERM_LINES=$(diff -u com.googlecode.iterm2.plist $DEST_ITERM | grep -E "^\-" | wc -l)
if [ $ADDED_ITERM_LINES -gt 0 ] || [ $REMOVED_ITERM_LINES -gt 0 ]
then
    echo -e "\nGit iTerm settings has differs from system by +$ADDED_ITERM_LINES and -$REMOVED_ITERM_LINES lines."
    read -p "Do you want to overwrite the system settings? (y/n [n])" OVERWRITE_ITERM
    if [[ $OVERWRITE_ITERM -eq "y" ]]
    then
        cp -f com.googlecode.iterm2.plist $DEST_ITERM
    fi
fi

# Install Oh-My-Zsh if not already installed.
if [ ! -d $HOME/.oh-my-zsh ]
then
    echo -e "\nInstalling Oh-My-Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Read Oh-my-zsh plugins from a specific file
sed -i '' -e 's/^plugins=.*/zmodload zsh\/mapfile;plugins=( "${(f)mapfile[myrc\/zsh_plugins]}" )/g' $HOME/.zshrc

# Add conda completions to plugins.
CONDA_COMPL_DIR=${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/conda-zsh-completion
if [ ! -d $CONDA_COMPL_DIR ]
then
    echo -e "\nInstalling Conda Zsh Completions..."
    git clone https://github.com/esc/conda-zsh-completion $CONDA_COMPL_DIR
fi

# Install TailScale from the latest known package.
# TODO: With a Python script...
# 1. Check if Tailscale is installed.
# 2. Read page https://pkgs.tailscale.com/stable/#macos
# 3. Match URL for text "Tailscale-*-macos.pkg"
# 4. Download the file under that link.
