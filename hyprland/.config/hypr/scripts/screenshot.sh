#!/usr/bin/env bash

SAVE_PATH="$HOME/Pictures/Screenshots"
DATETIME=$(date "+%Y-%m-%d_%Hh%Mm%Ss")

if [ ! -e $SAVE_PATH ]; then
  mkdir -p $SAVE_PATH
fi

FILENAME="Grimblast-$DATETIME.png"

grimblast --freeze --notify copysave area $SAVE_PATH/$FILENAME
