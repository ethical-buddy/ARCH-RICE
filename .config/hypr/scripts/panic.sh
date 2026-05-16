#!/bin/bash

STATE_FILE="/tmp/panic_mode"

if [ ! -f "$STATE_FILE" ] || [ "$(cat $STATE_FILE)" = "ONLINE" ]; then
    # ENTER PANIC MODE
    echo "OFFLINE" > "$STATE_FILE"
    brightnessctl set 20%
    # Save current workspace to return later
    hyprctl activeworkspace -j | jq -r '.id' > /tmp/prev_ws
    hyprctl dispatch workspace name:panic
    notify-send "SYSTEM OFFLINE" "Security Protocol Active" -u critical
else
    # EXIT PANIC MODE
    echo "ONLINE" > "$STATE_FILE"
    brightnessctl set 80%
    PREV_WS=$(cat /tmp/prev_ws 2>/dev/null || echo 1)
    hyprctl dispatch workspace "$PREV_WS"
    notify-send "SYSTEM ONLINE" "Protocols Restored"
fi

# Signal Waybar
pkill -SIGRTMIN+8 waybar
