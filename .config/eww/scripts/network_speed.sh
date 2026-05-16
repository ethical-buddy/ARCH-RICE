-- /home/suryansh/.config/eww/scripts/network_speed.sh
#!/bin/bash
# Get current network speeds (rx/tx)
# This is a placeholder, requires more sophisticated implementation for real-time graph
RX_SPEED=$(grep --no-filename -A 1 'RX bytes:' /proc/net/dev | tail -n 1 | awk '{print $2}')
TX_SPEED=$(grep --no-filename -A 1 'TX bytes:' /proc/net/dev | tail -n 1 | awk '{print $2}')
echo "RX: ${RX_SPEED} TX: ${TX_SPEED}"
