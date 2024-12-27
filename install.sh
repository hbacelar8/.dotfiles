#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit 1
fi

echo -e "┌────────── Configuration Script ──────────┐\n"

### -------------------- Fonts -------------------- ###

echo "┌ Install fonts"

# Packages to install
packages=("ttf-jetbrains-mono-nerd"
    "ttf-fantasque-nerd"
    "ttf-nerd-fonts-symbols"
    "noto-fonts-cjk"
    "noto-fonts-emoji"
    "noto-fonts")

# Join all packages into a single command and install them
echo "Installing packages: ${packages[*]}"
pacman -S --noconfirm "${packages[@]}"

# Check the result
if [ $? -eq 0 ]; then
    echo "All packages installed successfully."
else
    echo "Failed to install one or more packages."
    exit
fi

# Clean array
packages=()

echo -e "└ DONE\n"

### -------------------- Hypr Ecosystem -------------------- ###

echo "┌ Install Hyprland Packages"

# Packages to install
packages=("hyprland"
    "hyprpaper"
    "hyprlock"
    "xdg-desktop-portal-hyprland"
    "hyprutils")

# Join all packages into a single command and install them
echo "Installing packages: ${packages[*]}"
# pacman -S --noconfirm "${packages[@]}"

# Check the result
if [ $? -eq 0 ]; then
    echo "All packages installed successfully."
else
    echo "Failed to install one or more packages."
    exit
fi

# Clean array
packages=()

echo -e "└ DONE\n"

### -------------------- UI -------------------- ###

echo "┌ Install UI Packages"

# Packages to install
packages=("waybar"
    "rofi-wayland"
    "swaync")

# Join all packages into a single command and install them
echo "Installing packages: ${packages[*]}"
# pacman -S --noconfirm "${packages[@]}"

# Check the result
if [ $? -eq 0 ]; then
    echo "All packages installed successfully."
else
    echo "Failed to install one or more packages."
    exit
fi

# Clean array
packages=()

echo -e "└ DONE\n"

### -------------------- Terminal -------------------- ###

echo "┌ Install Terminal"

# Packages to install
packages=("wezterm")

# Join all packages into a single command and install them
echo "Installing packages: ${packages[*]}"
# pacman -S --noconfirm "${packages[@]}"

# Check the result
if [ $? -eq 0 ]; then
    echo "All packages installed successfully."
else
    echo "Failed to install one or more packages."
    exit
fi

# Clean array
packages=()

echo -e "└ DONE\n"

### -------------------- File Managers -------------------- ###

echo "┌ Install File Managers"

# Packages to install
packages=("yazi" "nautilus")

# Join all packages into a single command and install them
echo "Installing packages: ${packages[*]}"
# pacman -S --noconfirm "${packages[@]}"

# Check the result
if [ $? -eq 0 ]; then
    echo "All packages installed successfully."
else
    echo "Failed to install one or more packages."
    exit
fi

# Clean array
packages=()

echo -e "└ DONE\n"

### -------------------- Misc -------------------- ###

echo "┌ Install Misc Packages"

# Packages to install
packages=("firefox" "fastfetch" "btop" "imv" "neovim" "lazygit")

# Join all packages into a single command and install them
echo "Installing packages: ${packages[*]}"
# pacman -S --noconfirm "${packages[@]}"

# Check the result
if [ $? -eq 0 ]; then
    echo "All packages installed successfully."
else
    echo "Failed to install one or more packages."
    exit
fi

# Clean array
packages=()

echo -e "└ DONE\n"

echo -e "└────────── Configuration Script ──────────┘"
