#!/bin/bash

theme=$(/bin/cat ${HOME}/.config/rofi/themeip)

selected=$(rofi -dmenu -p "machine ip " -theme $theme )

echo $selected > ~/.config/bin/target
