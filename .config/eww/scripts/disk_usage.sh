-- /home/suryansh/.config/eww/scripts/disk_usage.sh
#!/bin/bash
# Get disk usage for /home
PARTITION="/"
USAGE=$(df -h "$PARTITION" | awk 'NR==2 {print $5}' | sed 's/%//')
echo $USAGE
