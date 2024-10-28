#!/bin/bash

# File to store the previous brightness level
BRIGHTNESS_FILE="/tmp/brightnessctl_previous_level"

# Get the current brightness level
CURRENT_BRIGHTNESS=$(brightnessctl get)

# Check if the brightness file exists and read the previous brightness level
if [ -f "$BRIGHTNESS_FILE" ]; then
  PREVIOUS_BRIGHTNESS=$(cat "$BRIGHTNESS_FILE")
else
  PREVIOUS_BRIGHTNESS=$CURRENT_BRIGHTNESS
fi

# Toggle brightness: if the current brightness is greater than 0, set it to 0, otherwise restore to previous brightness
if [ "$CURRENT_BRIGHTNESS" -gt 0 ]; then
  echo "$CURRENT_BRIGHTNESS" >"$BRIGHTNESS_FILE"
  brightnessctl set 0
else
  brightnessctl set "$PREVIOUS_BRIGHTNESS"
  rm "$BRIGHTNESS_FILE" # Remove the file after restoring brightness
fi
