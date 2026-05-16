#!/bin/bash

# A simple help script that parses hyprland.conf for bindings
CONF="$HOME/.config/hypr/hyprland.conf"

echo -e "\e[1;32m--- SYSTEM COMMANDS ---\e[0m"
grep -E "^bind" "$CONF" | grep -v "1, 2, 3, 4, 5" | awk -F', ' '{print $2 " + " $3 " -> " $4}' | sed 's/\$mainMod/SUPER/g' | column -t -s '->'

echo -e "\n\e[1;34m--- WORKSPACE SWITCHING ---\e[0m"
echo "SUPER + [1-5]   ->   Switch to Workspace"
echo "SUPER + SHIFT + [1-5] -> Move Window to Workspace"

echo -e "\n\e[1;33m--- SPECIAL SHORTCUTS ---\e[0m"
echo "SUPER + L      ->   Lock Screen"
echo "SUPER + P      ->   Panic Mode (Stealth)"
echo "SUPER + V      ->   Cycle Window (Compact/Full/Tiled)"
echo "SUPER + T/G    ->   Launch/Toggle Dropdown Terminal"
echo "SUPER + W      ->   Random Wallpaper & Sync Theme"
echo "SUPER + H      ->   Show this Help Page"
echo "Print (Key)    ->   Screenshot (Select Area)"

echo -e "\n\e[1;32mPress any key to close...\e[0m"
read -n 1
