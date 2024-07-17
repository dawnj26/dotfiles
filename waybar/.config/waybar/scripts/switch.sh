#!/usr/bin/env bash

if [[ $(pidof hypridle) ]]; then
  pkill hypridle
  notify-send "Hypridle is disabled"
else
  hypridle &
  notify-send "Hypridle is enabled"
fi
