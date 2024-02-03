#!/bin/bash

# make it executable with: chmod +x install-setup.sh

# Check if tmux is installed, install if not
if ! command -v tmux &> /dev/null; then
    echo "tmux could not be found, installing..."
    brew install tmux
else
    echo "tmux is already installed."
fi

# Define the target directory and the source file
target_dir="$HOME/.config/alacritty"
source_file="$HOME/dotfiles/alacritty.toml"
link_file="$target_dir/alacritty.toml"

# Create the target directory if it doesn't exist
if [ ! -d "$target_dir" ]; then
    echo "Creating directory: $target_dir"
    mkdir -p "$target_dir"
fi

# Create or update the symbolic link
if [ -L "$link_file" ]; then
    echo "Updating existing symbolic link: $link_file"
    # Remove existing symbolic link to ensure it can be updated
    rm "$link_file"
else
    echo "Creating new symbolic link: $link_file"
fi

# Create the symbolic link
ln -s "$source_file" "$link_file"

echo "Symbolic link created successfully."

