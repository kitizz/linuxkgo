echo -e "\nSetting up Zellij..."

# Link the config
mkdir -p $HOME/.config/zellij
ln -sf $PWD/zellij_config.kdl $HOME/.config/zellij/config.kdl

if [ `which zellij` ]
then
    echo -e "Zellij is already installed."
    exit 0
fi

# Linux logic inspired by:
# - https://gist.github.com/BaksiLi/ea2f505fdbe42349a5225390264c1f40
# - https://unix.stackexchange.com/a/429818
os=$(uname -s)
if [ "$os" == "Linux" ]; then
    filename="zellij-${arch}-unknown-linux-musl.tar.gz"
    url="https://github.com/zellij-org/zellij/releases/latest/download/$filename"
    echo -e "Downloading Zellij binary for Linux..."
    curl -s -L "$url" | tar -xvz -C /tmp

    echo -e "Moving Zellij binary to /bin directory..."
    sudo mv "/tmp/zellij" /bin/zellij
    sudo chmod +x /bin/zellij

    # Check if the Zellij binary exists
    if [ -f "/bin/zellij" ]; then
        echo "Zellij binary installed successfully!"
        exit 0
    else
        echo "Zellij binary not installed successfully!"
        exit 1
    fi
fi

BREWBIN=$(which brew)
if [ -z $BREWBIN ]; then
    # No homebrew, so install Zellij via Rust.

    echo -e "Installing Zellij via Rust because Homebrew isn't present."
    echo -e "This can take a while... consider sorting out Homebrew."

    # Setup cargo
    CARGO=$(which cargo)
    if [ -z $CARGO ]; then
        echo "Installing Rust"
        curl https://sh.rustup.rs -sSf | sh
        . "$HOME/.cargo/env"
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
