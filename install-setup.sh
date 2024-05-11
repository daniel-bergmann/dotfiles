#!/bin/bash

# make it executable with: chmod +x install-setup.sh

# Function to install tmux based on the operating system
install_tmux() {
    case "$OSTYPE" in
        darwin*) 
            # MacOS
            echo "Using Homebrew to install tmux on macOS"
            brew install tmux
            ;;
        linux*)   
            # Linux
            echo "Using APT to install tmux on Linux"
            sudo apt update && sudo apt install -y tmux
            ;;
        *)        
            echo "Unsupported operating system for this script"
            return 1
            ;;
    esac
}

# Check if tmux is installed, install if not
if ! command -v tmux &> /dev/null; then
    echo "tmux could not be found, installing..."
    install_tmux
else
    echo "tmux is already installed."
fi

# Define the target directory and the source file for Alacritty
target_dir="$HOME/.config/alacritty"
source_file="$HOME/dotfiles/alacritty.toml"
link_file="$target_dir/alacritty.toml"

# Create the target directory if it doesn't exist
if [ ! -d "$target_dir" ]; then
    echo "Creating directory: $target_dir"
    mkdir -p "$target_dir"
fi

# Create or update the symbolic link for Alacritty config
if [ -L "$link_file" ]; then
    echo "Updating existing symbolic link: $link_file"
    # Remove existing symbolic link to ensure it can be updated
    rm "$link_file"
else
    echo "Creating new symbolic link: $link_file"
fi

# Create the symbolic link for Alacritty config
ln -s "$source_file" "$link_file"
echo "Symbolic link for Alacritty config created successfully."

# Copy .tmux.conf from dotfiles to home directory
tmux_conf_source="$HOME/dotfiles/.tmux.conf"
tmux_conf_target="$HOME/.tmux.conf"

if [ -f "$tmux_conf_source" ]; then
    echo "Copying .tmux.conf to home directory..."
    cp "$tmux_conf_source" "$tmux_conf_target"
    echo ".tmux.conf copied successfully."
else
    echo ".tmux.conf does not exist in dotfiles directory, skipping copy."
fi

# Copy .vimrc to the directory above where the script is executed
vimrc_source="$HOME/dotfiles/.vimrc"
vimrc_target="$(dirname "$(pwd)")/.vimrc"  # $(dirname "$(pwd)") gets the parent directory of the current directory

if [ -f "$vimrc_source" ]; then
    cp "$vimrc_source" "$vimrc_target" && echo ".vimrc copied to parent directory successfully."
else
    echo ".vimrc not found in dotfiles directory, skipping copy."
fi

