#!/bin/bash

# Extract monitor name
FOCUSED_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')
echo "Active monitor: $FOCUSED_MONITOR"

# Define monitor types and their wallpapers
declare -A MONITOR_TYPES=(
  ["DP-1"]="landscape"
  ["DP-2"]="portrait"
  ["HDMI-A-1"]="landscape"
)

# Define wallpaper directories
LANDSCAPE_WALLPAPERS="$HOME/.config/hypr/wallpapers/rose-pine/landscape/"
PORTRAIT_WALLPAPERS="$HOME/.config/hypr/wallpapers/rose-pine/portrait/"

# Determine which wallpaper to use
monitor_type="${MONITOR_TYPES[$FOCUSED_MONITOR]}"

case "$monitor_type" in
"landscape")
  SELECTED_WALLPAPERS="$LANDSCAPE_WALLPAPERS"
  ;;
"portrait")
  SELECTED_WALLPAPERS="$PORTRAIT_WALLPAPERS"
  ;;
*)
  echo "Warning: Monitor '$FOCUSED_MONITOR' not found in configuration. Using landscape as default."
  SELECTED_WALLPAPERS="$LANDSCAPE_WALLPAPERS"
  ;;
esac

echo "Selected wallpapers: $SELECTED_WALLPAPERS"

# Check if directory exists
if [[ ! -d "$SELECTED_WALLPAPERS" ]]; then
  echo "Error: Directory '$SELECTED_WALLPAPERS' does not exist!"
  exit 1
fi

# Change to the wallpaper directory
cd "$SELECTED_WALLPAPERS" || exit 1

# Get all images (png, jpg, jpeg) and format for rofi, then capture selection
SELECTED_IMAGE=$({
  for img in *.jpg *.jpeg *.png; do
    # Check if file exists (handles case where no files match a pattern)
    if [[ -f "$img" ]]; then
      echo -en "$img\0icon\x1f$img\n"
    fi
  done
} | rofi -dmenu -p "")

# Check if user made a selection (didn't cancel)
if [[ -n "$SELECTED_IMAGE" ]]; then
  # Create the full path to the selected image
  FULL_IMAGE_PATH="$SELECTED_WALLPAPERS$SELECTED_IMAGE"

  # Set new wallpaper to active monitor
  hyprctl hyprpaper reload "$FOCUSED_MONITOR","$FULL_IMAGE_PATH"

  # Update hyprpaper.conf file
  HYPAPPER_CONF="$HOME/.config/hypr/hyprpaper.conf"

  # Clear the file and write new content
  >"$HYPAPPER_CONF" # Empty the file

  # Add preload entries from listloaded
  echo "# Preload wallpapers" >>"$HYPAPPER_CONF"
  hyprctl hyprpaper listloaded | while read -r line; do
    if [[ -n "$line" ]]; then
      echo "preload = $line" >>"$HYPAPPER_CONF"
    fi
  done

  # Add wallpaper entries from listactive
  echo "" >>"$HYPAPPER_CONF"
  echo "# Wallpaper assignments" >>"$HYPAPPER_CONF"
  hyprctl hyprpaper listactive | while IFS=' = ' read -r monitor path; do
    if [[ -n "$monitor" && -n "$path" ]]; then
      echo "wallpaper = $monitor,$path" >>"$HYPAPPER_CONF"
    fi
  done

  echo "Updated $HYPAPPER_CONF with current wallpaper configuration"
else
  echo "No image selected."
  exit 1
fi
