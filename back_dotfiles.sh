#!/usr/bin/env bash

set -e

BACKUP_DIR="$HOME/dotfiles"
mkdir -p "$BACKUP_DIR"

echo "📦 Zálohuji konfigurace do $BACKUP_DIR..."

# CONFIG DIRS
CONFIGS=(
  "waybar"
  "hypr"
  "hyprland"
  "hyprlock"
  "hyprpaper"
  "kitty"
  "fish"
  "rofi"
  "spicetify"
  "wlogout"
  "fastfetch"
  "yazi"
)

for cfg in "${CONFIGS[@]}"; do
  if [ -d "$HOME/.config/$cfg" ]; then
    echo "→ Kopíruji ~/.config/$cfg"
    mkdir -p "$BACKUP_DIR/.config/"
    rsync -av --delete "$HOME/.config/$cfg" "$BACKUP_DIR/.config/"
  else
    echo "⚠️  Přeskakuji $cfg — neexistuje"
  fi
done


# BIN SCRIPTS
BIN_SCRIPTS=(
  "/bin/screenshot_area.sh"
  "/bin/screenshot_full.sh"
  "$HOME/.local/bin/vpn_status.sh"
  "$HOME/.local/bin/toggle_vpn.sh"
)

for script in "${BIN_SCRIPTS[@]}"; do
  if [ -f "$script" ]; then
    echo "→ Kopíruji $script"
    mkdir -p "$BACKUP_DIR/scripts/bin"
    cp "$script" "$BACKUP_DIR/scripts/bin/"
  else
    echo "⚠️  Přeskakuji $script — neexistuje"
  fi
done


# EXTRA SCRIPTS
EXTRA=(
  "$HOME/.config/hypr/scripts/songdetail.sh"
  "$HOME/.config/waybar/mediaplayer.py"
)

for ex in "${EXTRA[@]}"; do
