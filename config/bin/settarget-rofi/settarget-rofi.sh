#!/bin/bash

selected=$(echo | rofi -dmenu -p "Machine ip  " -theme ${HOME}/.config/bin/settarget-rofi/settarget-theme.rasi )

echo $selected > ~/.config/bin/target
