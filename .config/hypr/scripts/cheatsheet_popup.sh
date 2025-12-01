#!/bin/bash

CHEATSHEET_FILE="$HOME/.config/hypr/scripts/arch_cheatsheet.txt"

# Použij cat k přečtení obsahu souboru a pošli jej rourou (|) do wofi
cat "$CHEATSHEET_FILE" | wofi --show dmenu \
     --conf /dev/null \
     --lines 100 \
     --width 600 \
     --height 800 \
     --prompt "Arch Linux Cheatsheet" \
     --cache-file /dev/null
