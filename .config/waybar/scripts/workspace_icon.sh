#!/bin/bash

# Function to get the active window's class
get_app_class() {
    hyprctl activewindow -j | jq -r '.class'
}

# Function to map application class to Waybar icon
get_icon_for_app() {
    local app_class=$1

    case "$app_class" in
        "kitty" | "Alacritty") echo "" ;;       # Terminal
        "firefox" | "Chromium") echo "" ;;     # Browser
        "org.kde.dolphin" | "pcmanfm-qt") echo "" ;; # File Manager
        "Code" | "helix") echo "" ;;          # Editor/IDE
        "spotify" | "spotify-client") echo "" ;; # Music Player
        "Wofi" | "rofi") echo "" ;;            # Launcher
        "waybar") echo "󰂠" ;;                  # Waybar itself (if needed)
        *) echo "" ;;                         # Default icon
    esac
}

# Get the icon for the active window
APP_CLASS=$(get_app_class)
ICON=$(get_icon_for_app "$APP_CLASS")

echo "$ICON"
