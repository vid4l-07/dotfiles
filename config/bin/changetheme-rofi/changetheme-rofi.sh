#!/usr/bin/env bash

options="Grey\nBlue\nPurple"

# Mostrar el menú con rofi
chosen=$(echo -e "$options" | rofi -dmenu -no-custom -format "s" \
    -theme ${HOME}/.config/bin/changetheme-rofi/column_theme.rasi -hide-scrollbar)
# Ejecutar comandos según la elección
case "$chosen" in
    "Grey")
		${HOME}/.config/bin/changetheme.sh -g
		;;
    "Blue")
        ${HOME}/.config/bin/changetheme.sh -b
		;;
    "Purple")
        ${HOME}/.config/bin/changetheme.sh -p
		;;
    *)
        exit 1
        ;;
esac
