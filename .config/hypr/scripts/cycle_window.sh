#!/bin/bash

# Get active window info
ACTIVE_WINDOW=$(hyprctl activewindow -j)
ADDRESS=$(echo "$ACTIVE_WINDOW" | jq -r '.address')
FLOATING=$(echo "$ACTIVE_WINDOW" | jq -r '.floating')
WIDTH=$(echo "$ACTIVE_WINDOW" | jq -r '.size[0]')

# State Cycle Logic
if [ "$FLOATING" = "false" ]; then
    # State 1: Make it Compact & Floating
    hyprctl dispatch setfloating address:"$ADDRESS"
    hyprctl dispatch resizeactive exact 800 500
    hyprctl dispatch centerwindow
elif [ "$WIDTH" -lt 1500 ]; then
    # State 2: Make it Full Size (Floating)
    hyprctl dispatch resizeactive exact 100% 100%
    hyprctl dispatch centerwindow
else
    # State 3: Return to Tiled
    hyprctl dispatch settiled address:"$ADDRESS"
fi
