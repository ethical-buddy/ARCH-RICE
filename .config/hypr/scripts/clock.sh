#!/bin/bash
# Simple hacker clock
while true; do
    clear
    echo -e "\e[1;32m"
    date +"%H:%M:%S" | figlet -f slant
    echo -e "\e[0m"
    sleep 1
done
