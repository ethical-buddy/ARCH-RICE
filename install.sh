#!/bin/bash

# #######################################################################################
# ARCH-HYPRLAND "CYBER-ZEN" INSTALLER
# #######################################################################################

set -e

echo "🚀 Starting Cyber-Zen Rice Installation..."

# 1. Install AUR Helper (yay) if missing
if ! command -v yay &> /dev/null; then
    echo "📦 Installing yay..."
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin && makepkg -si --noconfirm && cd ..
    rm -rf yay-bin
fi

# 2. Install all core dependencies
echo "📦 Installing dependencies..."
yay -S --noconfirm \
    hyprland hyprlock hypridle waybar kitty mako starship zsh \
    python-pywal awww-git brightnessctl pamixer playerctl \
    grim slurp libnotify figlet bmon neovim jq bc lm_sensors \
    nm-connection-editor blueman eww-git bibata-cursor-theme-bin \
    ttf-jetbrains-mono-nerd noto-fonts-emoji

# 3. Create Backups of existing configs
echo "📂 Backing up existing configurations..."
mkdir -p ~/dotfiles_backup_$(date +%Y%m%d_%H%M%S)
[ -d ~/.config/hypr ] && cp -r ~/.config/hypr ~/dotfiles_backup_$(date +%Y%m%d_%H%M%S)/ || true
[ -d ~/.config/waybar ] && cp -r ~/.config/waybar ~/dotfiles_backup_$(date +%Y%m%d_%H%M%S)/ || true
[ -d ~/.config/kitty ] && cp -r ~/.config/kitty ~/dotfiles_backup_$(date +%Y%m%d_%H%M%S)/ || true
[ -f ~/.zshrc ] && cp ~/.zshrc ~/dotfiles_backup_$(date +%Y%m%d_%H%M%S)/ || true

# 4. Copy new configurations
echo "📂 Applying Cyber-Zen configurations..."
mkdir -p ~/.config
cp -r .config/* ~/.config/
cp zshrc ~/.zshrc

# 5. Set up wallpapers
echo "🖼️ Setting up wallpapers..."
mkdir -p ~/Downloads/pictures
cp wallpapers/* ~/Downloads/pictures/

# 6. Fix Permissions for scripts
echo "🔐 Setting executable permissions..."
chmod +x ~/.config/hypr/scripts/*.sh

# 7. Change shell to ZSH
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "🐚 Changing shell to zsh..."
    chsh -s /usr/bin/zsh
fi

echo "✅ Installation Complete!"
echo "✨ Restart Hyprland to experience the Cyber-Zen rice."
echo "🔗 Shortcuts: Press SUPER + H in your new setup for the help menu."
