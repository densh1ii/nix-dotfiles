#!/usr/bin/env bash
# Bluetooth status for polybar (grayscale icons, no colors here —
# styling is handled by the module's format-foreground in config.ini)
#
# Save as ~/.config/polybar/scripts/bluetooth.sh and chmod +x it.

if ! command -v bluetoothctl &> /dev/null; then
  echo " n/a"
  exit 0
fi

if ! bluetoothctl show | grep -q "Powered: yes"; then
  echo " off"
  exit 0
fi

# Check if any device is currently connected
if bluetoothctl devices Connected | grep -q "Device"; then
  device=$(bluetoothctl devices Connected | head -n1 | cut -d' ' -f3-)
  echo " ${device}"
else
  echo " on"
fi
