#!/bin/bash

IMG=$(swww query | awk -F 'image: ' '{print $2}')

swaylock \
  --image "$IMG" \
  --clock \
  --indicator \
  --indicator-radius 120 \
  --indicator-thickness 8 \
  --effect-blur 10x6 \
  --effect-vignette 0.7:0.7 \
  --ring-color 33ccff \
  --key-hl-color 00ff99 \
  --line-color 00000000 \
  --inside-color 00000088 \
  --text-color ffffff \
  --separator-color 00000000 \
  --time-str "%H:%M" \
  --date-str "%A • %d %B"
