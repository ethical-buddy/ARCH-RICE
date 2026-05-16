#!/bin/bash

# Ghost Notepad script
# Opens nvim in a super minimalist mode for quick notes

NOTES_FILE="$HOME/Documents/ghost_notes.md"

# Ensure the file exists
mkdir -p "$(dirname "$NOTES_FILE")"
touch "$NOTES_FILE"

# Launch nvim with minimalist settings:
# - no numbers, no status line, no ruler, no command line, no list chars
# - background matches the 0.0 opacity set in kitty.conf
exec nvim -c "set noshowmode noruler laststatus=0 nonumber norelativenumber nolist wrap linebreak" "$NOTES_FILE"
