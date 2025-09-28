#!/bin/bash

set -e

# Start timer
START_TIME=$(date +%s)

echo ">>> Checking for root privileges..."
if [[ $EUID -ne 0 ]]; then
  echo "❌ Please run this script with sudo or as root."
  exit 1
fi

echo ">>> Updating system package database..."
pacman -Syu --noconfirm

# Install stow first so it can be used immediately
if pacman -Qi stow &>/dev/null; then
  echo "✅ stow is already installed."
else
  echo "📦 Installing stow..."
  pacman -S --noconfirm stow
fi

# Get directory where script is located (to stow configs relative to this)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# List of config folders to stow
CONFIG_FOLDERS=(
  bat
  btop
  fastfetch
  git
  hypr
  imv
  lazygit
  nvim
  rofi
  swaync
  waybar
  wezterm
  yazi
  zellij
  zsh
)

echo ">>> Stowing configuration folders..."
pushd "$SCRIPT_DIR" >/dev/null
for folder in "${CONFIG_FOLDERS[@]}"; do
  if [[ -d "$folder" ]]; then
    echo "🗂️  Stowing $folder..."
    stow "$folder"
  else
    echo "⚠️ Config folder '$folder' not found, skipping."
  fi
done
popd >/dev/null

# Function to install paru from AUR if not installed
install_paru() {
  if command -v paru &>/dev/null; then
    echo "✅ paru is already installed."
  else
    echo ">>> paru not found. Installing paru from AUR..."
    # Install prerequisites first
    pacman -S --needed --noconfirm git base-devel

    # Clone paru repo and build/install
    tmp_dir=$(mktemp -d)
    git clone https://aur.archlinux.org/paru.git "$tmp_dir/paru"
    pushd "$tmp_dir/paru" || exit
    makepkg -si --noconfirm
    popd || exit

    # Clean up
    rm -rf "$tmp_dir"
  fi
}

# Hyprland-related packages
HYPR_PACKAGES=(
  hyprland
  hyprpaper
  hyprlock
  hyprshot
  xdg-desktop-portal-hyprland
)

# Fonts and icon themes
FONT_ICON_PACKAGES=(
  ttf-iosevkaterm-nerd
  ttf-nerd-fonts-symbols
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts
  papirus-icon-theme
)

# UI packages
UI_PACKAGES=(
  waybar
  rofi
  swaync
  rofimoji
)

# Terminal emulators
TERMINAL_PACKAGES=(
  wezterm
  zellij
)

# TUI applications
TUI_PACKAGES=(
  yazi
  fastfetch
  btop
  lazygit
  bat
  fzf
  ripgrep
)

# Miscellaneous packages (stow removed)
MISC_PACKAGES=(
  nautilus
  gvfs-mtp
  imv
  udiskie
)

# Track results for summary
declare -A SUMMARY

# Generic package installation function using pacman
install_packages() {
  local section="$1"
  shift
  local packages=("$@")
  local installed_new=false

  echo ">>> Installing $section..."
  for pkg in "${packages[@]}"; do
    if pacman -Qi "$pkg" &>/dev/null; then
      echo "✅ $pkg is already installed."
    else
      echo "📦 Installing $pkg..."
      pacman -S --noconfirm "$pkg"
      installed_new=true
    fi
  done

  if $installed_new; then
    SUMMARY["$section"]="✅ Installed"
  else
    SUMMARY["$section"]="✔️ Already up to date"
  fi
}

# Install paru before AUR packages
install_paru

# Install package groups
install_packages "Hyprland and related packages" "${HYPR_PACKAGES[@]}"
install_packages "Fonts and icon themes" "${FONT_ICON_PACKAGES[@]}"
install_packages "UI packages (Waybar, Rofi, etc.)" "${UI_PACKAGES[@]}"
install_packages "Terminal emulators (WezTerm, Zellij)" "${TERMINAL_PACKAGES[@]}"
install_packages "TUI applications" "${TUI_PACKAGES[@]}"
install_packages "Miscellaneous tools" "${MISC_PACKAGES[@]}"

# Themes installation block (pacman + paru)
install_themes() {
  echo ">>> Installing Themes..."

  # Pacman package
  if pacman -Qi xdg-desktop-portal-gtk &>/dev/null; then
    echo "✅ xdg-desktop-portal-gtk is already installed."
  else
    echo "📦 Installing xdg-desktop-portal-gtk with pacman..."
    pacman -S --noconfirm xdg-desktop-portal-gtk
    SUMMARY["Themes"]="✅ Installed"
  fi

  # Paru package
  if paru -Qi catppuccin-gtk-theme-mocha &>/dev/null; then
    echo "✅ catppuccin-gtk-theme-mocha is already installed."
    SUMMARY["Themes"]="${SUMMARY["Themes"]} + ✔️ Already up to date"
  else
    echo "📦 Installing catppuccin-gtk-theme-mocha with paru..."
    paru -S --noconfirm catppuccin-gtk-theme-mocha
    SUMMARY["Themes"]="✅ Installed"
  fi

  # If neither installed new, mark accordingly
  if [[ -z "${SUMMARY["Themes"]}" ]]; then
    SUMMARY["Themes"]="✔️ Already up to date"
  fi
}

install_themes

# End timer and calculate duration
END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
MINUTES=$((DURATION / 60))
SECONDS=$((DURATION % 60))

# Final summary output
echo ""
echo "==============================="
echo "✅ Installation Summary:"
echo "==============================="
for key in "${!SUMMARY[@]}"; do
  printf "• %-35s %s\n" "$key" "${SUMMARY[$key]}"
done
echo "==============================="
echo "🕒 Time taken: ${MINUTES}m ${SECONDS}s"
echo "🎉 Setup completed successfully!"

# Optional reboot prompt
echo ""
read -rp "🔄 Would you like to reboot now? [y/N]: " REBOOT_ANSWER
if [[ "$REBOOT_ANSWER" =~ ^[Yy]$ ]]; then
  echo "Rebooting..."
  reboot
else
  echo "Reboot skipped. You can reboot later manually."
fi
