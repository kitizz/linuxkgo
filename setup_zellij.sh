echo -e "\nSetting up Zellij..."

# Link the config
ln -sf $PWD/zellij_config.kdl $HOME/.config/zellij/config.kdl

if [ `which zellij` ]
then
    echo -e "Zellij is already installed."
    exit 0
fi

BREWBIN=$(which brew)
if [ -z $BREWBIN ]; then
    # No homebrew, so install Zellij via Rust.

    echo -e "Installing Zellij via Rust"

    # Setup cargo
    CARGO=$(which cargo)
    if [ -z $CARGO ]; then
        echo "Installing Rust"
        curl https://sh.rustup.rs -sSf | sh
    else
        echo "Updating Rust"
        rustup update stable
    fi

    # Install Zellij
    cargo install --locked zellij

else
    # Use homebrew to install zellij
    echo -e "Installing Zellij via homebrew"
    brew install zellij
fi
