#!/bin/bash

# Function to get the active window's class
get_active_window_class() {
    hyprctl activewindow -j | jq -r '.class'
}

# Function to map application class to Waybar icon
get_workspace_icon() {
    local app_class=$(get_active_window_class)

    case "$app_class" in
        "kitty" | "Alacritty") echo "" ;;       # Terminal
        "firefox" | "Chromium") echo "" ;;     # Browser
        "org.kde.dolphin" | "pcmanfm-qt") echo "" ;; # File Manager
        "Code" | "helix") echo "" ;;          # Editor/IDE
        "spotify" | "spotify-client") echo "" ;; # Music Player
        "Wofi" | "rofi") echo "" ;;            # Launcher
        *) echo "" ;;                         # Default icon
    esac
}

# Main logic to get the icon for the current workspace/window
ICON=$(get_workspace_icon)
echo "$ICON"
