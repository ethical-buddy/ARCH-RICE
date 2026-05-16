#!/bin/bash

WS=$1
if [ -z "$WS" ]; then exit 1; fi

# Take screenshot
if ! grim /tmp/screen_switch.png; then
    hyprctl dispatch workspace "$WS"
    exit 0
fi

# Pixelate
magick /tmp/screen_switch.png -scale 10% -scale 1000% /tmp/screen_switch_pixel.png

# Display pixelated version as wallpaper temporarily
# Ensure awww is running
pgrep awww-daemon >/dev/null || awww-daemon &
sleep 0.1

awww img /tmp/screen_switch_pixel.png --transition-step 255 --transition-duration 0.1

# Switch workspace
hyprctl dispatch workspace "$WS"

# Apply the real workspace wallpaper
~/.config/hypr/wallpaper.sh "$WS"

# Clean up
rm /tmp/screen_switch.png /tmp/screen_switch_pixel.png
