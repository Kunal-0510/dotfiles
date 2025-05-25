#!/bin/bash
# install.sh - Complete Arch Linux development environment setup

set -e

echo "🔧 Setting up complete development environment..."

# Install AUR helper (yay)
install_yay() {
    if ! command -v yay &>/dev/null; then
        echo "Installing yay AUR helper..."
        cd /tmp
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd -
    fi
}

# Install development packages
install_dev_packages() {
    echo "Installing development packages..."

    # Official repository packages
    sudo pacman -S --noconfirm \
        python python-pip \
        rust cargo \
        clang \
        gdb \
        ripgrep \
        fd \
        fzf \
        lazygit \
        tree-sitter \
        tree-sitter-cli

    # AUR packages
    yay -S --noconfirm \
        visual-studio-code-bin \
        google-chrome \
}

# Setup Python development
setup_python() {
    echo "Setting up Python development environment..."
    pip install --user pylsp ruff black isort
}

# Main execution
install_yay
install_dev_packages
setup_python

echo "✅ Development environment setup complete!"
