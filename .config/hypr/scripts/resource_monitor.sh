#!/bin/bash

LAST_STATE="NORMAL"

while true; do
    # Get Max CPU Temp
    TEMP=$(sensors | grep "Package id 0" | awk '{print $4}' | tr -d '+°C' | cut -d. -f1)
    # Get CPU Usage
    USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}' | cut -d. -f1)
    
    CURRENT_STATE="NORMAL"
    if [ -n "$TEMP" ] && [ "$TEMP" -gt 80 ]; then
        CURRENT_STATE="CRITICAL"
    elif [ -n "$USAGE" ] && [ "$USAGE" -gt 85 ]; then
        CURRENT_STATE="WARNING"
    fi

    if [ "$CURRENT_STATE" != "$LAST_STATE" ]; then
        if [ "$CURRENT_STATE" = "CRITICAL" ]; then
            hyprctl keyword general:col.active_border "rgba(ff0000ee) rgba(880000ee) 45deg"
            hyprctl keyword decoration:shadow:color "rgba(ff0000ee)"
        elif [ "$CURRENT_STATE" = "WARNING" ]; then
            hyprctl keyword general:col.active_border "rgba(ffaa00ee) rgba(884400ee) 45deg"
            hyprctl keyword decoration:shadow:color "rgba(ffaa00aa)"
        else
            # Restore Matrix Green
            hyprctl keyword general:col.active_border "rgba(00ff41ee) rgba(00ff41ee) rgba(004411ee) 45deg"
            hyprctl keyword decoration:shadow:color "rgba(00ff41aa)"
        fi
        LAST_STATE=$CURRENT_STATE
    fi
    sleep 3 # Increased sleep for stability
done
