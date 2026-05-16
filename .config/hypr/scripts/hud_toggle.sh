#!/bin/bash

# Toggle Clock HUD (Top Left)
if pgrep -f "kitty --class clock_hud" > /dev/null; then
    pkill -f "kitty --class clock_hud"
else
    # Large clock at top-left
    hyprctl dispatch exec "[float;noborder;pin;size 800 500;move 20 50] kitty --class clock_hud ~/.config/hypr/scripts/clock.sh"
fi

# Toggle Network Traffic HUD (Top Right - Restored to previous bmon)
if pgrep -f "kitty --class net_hud" > /dev/null; then
    pkill -f "kitty --class net_hud"
else
    # Increased size to (800x900) to ensure full output printing
    # Moved to 1050 to keep it in the visible area
    hyprctl dispatch exec "[float;noborder;pin;size 800 900;move 1050 50] kitty --class net_hud bmon"
fi
