#!/bin/bash

# --- CONFIG ---
DIR="$HOME/Downloads/pictures/"

# Ensure directory exists
if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
    exit 1
fi

# Define workspace-to-image mapping
declare -A WS_MAP
WS_MAP[1]="$DIR/cosmos.jpg"
WS_MAP[2]="$DIR/RED-intersteller.jpg"
WS_MAP[3]="$DIR/red-wave.jpg"
WS_MAP[4]="$DIR/purple-land.jpg"
WS_MAP[5]="$DIR/WaR.jpg"

# Function to apply wallpaper and theme
apply_wallpaper() {
    local img=$1
    if [ -f "$img" ]; then
        # 1. Update the actual wallpaper using 'awww'
        # Ensure daemon is running
        if ! pgrep -x "awww-daemon" > /dev/null; then
            awww-daemon &
            sleep 0.5
        fi
        
        awww img "$img" \
            --transition-type grow \
            --transition-pos center \
            --transition-step 90 \
            --transition-duration 1.5
        
        # 2. Update terminal colors via pywal
        wal -i "$img" -n -q
        
        # 3. Notification removed as requested
        # notify-send "Theme Updated" "Wallpaper: $(basename "$img")"
    fi
}

# Logic
if [ -n "$1" ]; then
    # If called with a workspace number
    WS=$1
    if [[ -n "${WS_MAP[$WS]}" ]]; then
        apply_wallpaper "${WS_MAP[$WS]}"
    else
        # Fallback if no specific WS mapping
        RAND_IMG=$(find "$DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | shuf -n1)
        apply_wallpaper "$RAND_IMG"
    fi
else
    # Default: Pick a random image
    RAND_IMG=$(find "$DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | shuf -n1)
    apply_wallpaper "$RAND_IMG"
fi
