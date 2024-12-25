# Dotfiles

Personal dotfiles for [Hyprland](https://hyprland.org/) and Catppuccin Mocha
based theme.

## Dependencies

### AUR Helper

```bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

### Fonts

```bash
sudo pacman -S ttf-fantasque-nerd ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols
```

### GTK Theme

```bash
paru -S catppuccin-gtk-theme-mocha
```

### Hypr Ecosystem

```bash
sudo pacman -S hyprland hyprpaper hyprlock xdg-desktop-portal-hyprland hyprutils
```

```bash
paru -S hyprshot
```

### UI

```bash
sudo pacman -S waybar rofi-wayland swaync
```

### Terminal Emulator

```bash
sudo pacman -S wezterm
```

### File Managers

```bash
sudo pacman -S yazi nautilus
```

### Misc

```bash
sudo pacman -S fastfetch btop imv neovim lazygit
```

## Installation

Clone it in your home directory:

```bash
cd && git clone git@github.com:hbacelar8/.dotfiles.git
```

## Usage

In the .dotfiles directory, stow every config:

```bash
stow btop fastfetch hypr imv lazygit nvim rofi swaync waybar wezterm yazi
```
