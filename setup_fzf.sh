TEMP_FD="$(mktemp).deb" &&
curl -s https://api.github.com/repos/sharkdp/fd/releases/latest \
    | grep "browser_download_url.*fd-musl.*amd64\.deb" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -O $TEMP_FD -qi - &&
sudo apt install $TEMP_FD

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&
~/.fzf/install

