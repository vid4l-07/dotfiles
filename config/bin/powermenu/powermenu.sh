#!/usr/bin/env bash

poweroff=""
reboot="󰑓"
logout=""
lock=""


# Mostrar el menú con rofi
chosen=$(echo -e "$poweroff\n$reboot\n$logout\n$lock" | rofi -dmenu -no-custom -format "s" \
    -theme ${HOME}/.config/bin/powermenu/powermenu.rasi -hide-scrollbar)
# Ejecutar comandos según la elección
case "$chosen" in
    $poweroff)
        systemctl poweroff
		;;
    $reboot)
        systemctl reboot
		;;
    $logout)
        bspc quit
		;;
	$lock)
		i3lock-fancy
		;;
    *)
        exit 1
        ;;
esac
