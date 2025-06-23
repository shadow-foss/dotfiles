#!/usr/bin/env bash

NORMAL_CONF="$HOME/.config/picom/picom-normal.conf"
BATTERY_CONF="$HOME/.config/picom/picom-battery.conf"

# Kill existing picom instance
pkill -x picom 2>/dev/null

# Get battery device path safely
BATTERY_PATH=$(upower -e | grep -m 1 'BAT')

if [[ -n "$BATTERY_PATH" ]] && upower -i "$BATTERY_PATH" | grep -q "state:\s*discharging"; then
  echo "Starting picom in battery-saving mode..."
  picom --config "$BATTERY_CONF" --daemon
else
  echo "Starting picom in normal mode..."
  picom --config "$NORMAL_CONF" --daemon
fi
