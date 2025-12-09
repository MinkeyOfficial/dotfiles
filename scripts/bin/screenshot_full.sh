#!/bin/bash
FILENAME="Screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"
OUTPUT_DIR="$HOME/Obrázky/Screenshots"
mkdir -p "$OUTPUT_DIR"

# Pořídí snímek celé obrazovky a uloží ho do souboru
grim - | tee "$OUTPUT_DIR/$FILENAME" | wl-copy -t image/png
 
# Volitelné: Zkopíruje obrázek do schránky (bez souboru)
# grim - | wl-copy

# Zobrazí oznámení
notify-send "Snímek obrazovky" "Celá obrazovka uložena jako: $FILENAME"
