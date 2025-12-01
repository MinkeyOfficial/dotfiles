#!/bin/bash
FILENAME="Screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"
OUTPUT_DIR="$HOME/Obrázky/Screenshots"
mkdir -p "$OUTPUT_DIR"

# Použije slurp pro výběr oblasti a grim pro pořízení snímku
grim -g "$(slurp)" - | tee "$OUTPUT_DIR/$FILENAME" | wl-copy -t image/png

# Zobrazí oznámení
notify-send "Snímek obrazovky" "Vybraná oblast uložena jako: $FILENAME"

# Volitelné: Otevře snímek v Swappy pro úpravu (před uložením)
# grim -g "$(slurp)" - | swappy -f "$OUTPUT_DIR/$FILENAME"
