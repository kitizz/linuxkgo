echo -e "\nSetting up Zellij..."

BREWBIN=$(which brew)
if [ -z $BREWBIN ]; then
    # No homebrew, so install Zellij via Rust.

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
    HOMEBREW_NO_AUTO_UPDATE=1 brew install zellij
fi
