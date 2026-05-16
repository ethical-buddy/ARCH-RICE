#!/bin/bash

STATE_FILE="/tmp/zen_mode"

if [ ! -f "$STATE_FILE" ] || [ "$(cat $STATE_FILE)" = "OFF" ]; then
    # ENTER ZEN MODE
    echo "ON" > "$STATE_FILE"
    pkill waybar
    makoctl mode -a do-not-disturb
    pamixer -m # Mute audio
    hyprctl keyword general:gaps_in 100
    hyprctl keyword general:gaps_out 120
    # Black wallpaper (solid color)
    awww clear 000000
    # REMOVED: Automatic monitor off to prevent black screen issues
    notify-send "ZEN MODE ACTIVE" "Focus protocol initiated." -u critical
else
    # EXIT ZEN MODE
    echo "OFF" > "$STATE_FILE"
    hyprctl dispatch exec waybar
    makoctl mode -r do-not-disturb
    pamixer -u # Unmute audio
    hyprctl keyword general:gaps_in 8
    hyprctl keyword general:gaps_out 25
    # Restore wallpaper
    ~/.config/hypr/wallpaper.sh
    notify-send "ZEN MODE INACTIVE" "Focus protocol terminated."
fi
