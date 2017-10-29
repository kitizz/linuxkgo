cp -i tmux.conf ~/.tmux.conf

# Install powerline and add bindigns to tmux
pip3 install powerline-status --user

echo source \"`python3 -c "import powerline; print(powerline.config.BINDINGS_DIRECTORY)"`/tmux/powerline.conf\" >> ~/.tmux_test.conf

