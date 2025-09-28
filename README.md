# Dotfiles

Personal dotfiles for [Hyprland](https://hyprland.org/) and Catppuccin Mocha
based theme.

| ![Image 1](screenshots/all.png)       | ![Image 2](screenshots/all2.png)    |
|---------------------------------------|-------------------------------------|
| ![Image 3](screenshots/launcher.png)  | ![Image 4](screenshots/screen1.png) |

<details>
  <summary>Portrait Monitor</summary>

  ![Image 4](screenshots/screen2.png)

</details>

## Key Bindings

| Keybind                       | Action                              |
|-------------------------------|-------------------------------------|
| SUPER + T                     | Open terminal (Ghostty)             |
| SUPER + C                     | Kill active window                  |
| SUPER + V                     | Toggle floating                     |
| SUPER + P                     | Toggle pseudo                       |
| SUPER + J                     | Swap split direction                |
| SUPER + A                     | Swap split positions                |
| SUPER + B                     | Open browser (Firefox)              |
| SUPER + L                     | Lock screen (Hyprlock)              |
| SUPER + Q                     | Open notifications panel            |
| SUPER + SHIFT + S             | Run Hyprshot region mode            |
| SUPER + Space                 | Open app launcher (Rofi)            |
| SUPER + M                     | Open emoji selector (Rofimoji)      |
| SUPER + SHIFT + [h/j/k/l]     | Move window focus                   |
| SUPER + [0-9]                 | Switch between workspaces           |
| SUPER + SHIFT + [0-9]         | Move active window to a workspace   |
| SUPER + [Left Mouse Button]   | Drag to move window                 |
| SUPER + [Right Mouse Button]  | Drag to resize window               |

## Dependencies

<details>
  <summary>AUR Helper</summary>

  ```bash
  sudo pacman -S --needed base-devel
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
  ```

</details>

<details>
  <summary>Fonts and Icons</summary>

  ```bash
  sudo pacman -S ttf-fantasque-nerd ttf-nerd-fonts-symbols papirus-icon-theme
  ```

</details>

<details>
  <summary>GTK Theme</summary>

  ```bash
  sudo pacman -S xdg-desktop-portal-gtk
  ```

  ```bash
  paru -S catppuccin-gtk-theme-mocha
  ```

</details>

<details>
  <summary>Hypr Ecosystem</summary>

  ```bash
  sudo pacman -S hyprland hyprpaper hyprlock xdg-desktop-portal-hyprland hyprutils
  ```

  ```bash
  paru -S hyprshot
  ```

</details>

<details>
  <summary>UI</summary>

  ```bash
  sudo pacman -S waybar rofi-wayland swaync rofimoji
  ```

</details>

<details>
  <summary>Terminal Emulator</summary>

  ```bash
  sudo pacman -S ghostty zellij
  ```

</details>

<details>
  <summary>File Managers</summary>

  ```bash
  sudo pacman -S yazi nautilus
  ```

  ---
  **_NOTE:_**

  For MTP to be shown on Nautilus

  ```bash
  sudo pacman -S gvfs-mtp
  ```
  ---

</details>

<details>
  <summary>Misc</summary>

  ```bash
  sudo pacman -S fastfetch btop imv neovim lazygit udiskie
  ```

</details>

## Installation

Clone it in your home directory:

```bash
cd && git clone git@github.com:hbacelar8/.dotfiles.git
```

## Usage

In the .dotfiles directory, stow every config:

```bash
stow btop fastfetch hypr imv lazygit nvim rofi swaync waybar ghostty zellij yazi zsh
```
