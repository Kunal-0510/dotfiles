#!/bin/bash
# setup.sh - Dotfiles setup for Arch Linux

set -e # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Setting up dotfiles for Arch Linux...${NC}"

# Check if running on Arch Linux
if ! command -v pacman &>/dev/null; then
    echo -e "${RED}❌ This script is designed for Arch Linux (pacman not found)${NC}"
    exit 1
fi

# Install dependencies
install_dependencies() {
    echo -e "${YELLOW}📦 Installing dependencies...${NC}"

    # Update package database
    sudo pacman -Sy

    # Install essential packages
    packages=(
        "stow"       # For dotfiles management
        "git"        # Version control
        "neovim"     # Text editor
        "base-devel" # Build tools
        "curl"       # Download tool
        "wget"       # Download tool
        "unzip"      # Archive tool
    )

    for package in "${packages[@]}"; do
        if ! pacman -Qi "$package" &>/dev/null; then
            echo -e "${BLUE}Installing $package...${NC}"
            sudo pacman -S --noconfirm "$package"
        else
            echo -e "${GREEN}✓ $package already installed${NC}"
        fi
    done
}

# Setup Neovim configuration
setup_nvim() {
    echo -e "${YELLOW}⚙️  Setting up Neovim configuration...${NC}"

    # Create stow structure
    echo -e "${BLUE}Creating stow directory structure...${NC}"
    mkdir -p nvim/.config

    # Copy files to stow structure (preserve originals for clean GitHub repo)
    if [ -d "nvim" ] && [ "$(ls -A nvim)" ]; then
        cp -r nvim/* nvim/.config/nvim/ 2>/dev/null || true

        # Remove copied files from root (keep only in .config/nvim)
        find nvim -mindepth 1 -maxdepth 1 -not -name ".config" -exec rm -rf {} \;
    fi

    # Backup existing neovim config
    if [ -d "$HOME/.config/nvim" ]; then
        backup_dir="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
        echo -e "${YELLOW}📁 Backing up existing neovim config to $backup_dir${NC}"
        mv "$HOME/.config/nvim" "$backup_dir"
    fi

    # Create .config directory if it doesn't exist
    mkdir -p "$HOME/.config"

    # Apply stow
    echo -e "${BLUE}Creating symlinks with stow...${NC}"
    stow nvim

    echo -e "${GREEN}✅ Neovim configuration linked successfully${NC}"
}

# Verify installation
verify_setup() {
    echo -e "${YELLOW}🔍 Verifying setup...${NC}"

    # Check if symlink was created correctly
    if [ -L "$HOME/.config/nvim" ]; then
        echo -e "${GREEN}✓ Neovim config symlink created successfully${NC}"
        echo -e "${BLUE}   Target: $(readlink -f $HOME/.config/nvim)${NC}"
    else
        echo -e "${RED}❌ Neovim config symlink not found${NC}"
        exit 1
    fi

    # Check if neovim can start
    if nvim --version &>/dev/null; then
        echo -e "${GREEN}✓ Neovim is working correctly${NC}"
    else
        echo -e "${RED}❌ Neovim installation issue${NC}"
        exit 1
    fi
}

# Main execution
main() {
    install_dependencies
    setup_nvim
    verify_setup

    echo -e "${GREEN}🎉 Dotfiles setup complete!${NC}"
    echo -e "${BLUE}📝 Next steps:${NC}"
    echo -e "   1. Start neovim: ${YELLOW}nvim${NC}"
    echo -e "   2. Let LazyVim install plugins automatically"
    echo -e "   3. Make changes to your config in: ${YELLOW}~/.dotfiles/nvim/${NC}"
    echo -e "   4. Commit changes: ${YELLOW}cd ~/.dotfiles && git add . && git commit -m 'update'${NC}"
}

# Run main function
main
