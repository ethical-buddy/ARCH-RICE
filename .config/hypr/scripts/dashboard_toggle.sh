#!/bin/bash

# Ensure eww daemon is running
if ! pgrep -x "eww" > /dev/null; then
    eww daemon
    sleep 0.5
fi

# Toggle logic
if eww active-windows | grep -q "dashboard"; then
    eww close dashboard
else
    eww open dashboard
fi
