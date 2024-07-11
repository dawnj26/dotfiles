#!/usr/bin/env bash

CONFIG="$HOME/.config/wofi/config/config"
STYLE="$HOME/.config/wofi/src/mocha/style.css"

LAUNCHER="rofi"
CMD_LAUNCHER="${LAUNCHER} --conf "${CONFIG}" --style "${STYLE}" --show drun"

if [[ $LAUNCHER == "rofi" ]]; then
  CONFIG="$HOME/.config/rofi"
  THEME_TYPE="type-6"

  CMD_LAUNCHER="$CONFIG/launchers/$THEME_TYPE/launcher.sh"
fi

if [[ ! $(pidof $LAUNCHER) ]]; then
  $CMD_LAUNCHER
else
  pkill $LAUNCHER
fi
