#!/bin/bash
# Hacker Log HUD - Live System Intel
# Scrolling Green text for that authentic hacker feel
while true; do
    echo -e "\e[1;32m"
    journalctl -n 50 --no-hostname --no-pager | tail -n 25
    echo -e "\e[0m"
    # Update every 5 seconds to keep it dynamic but not CPU intensive
    sleep 5
    clear
done
