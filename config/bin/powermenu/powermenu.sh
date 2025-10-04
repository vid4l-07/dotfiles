#!/usr/bin/env bash

poweroff=""
reboot="󰑓"
logout=""
lock=""

theme=$(/bin/cat $HOME/.config/bin/powermenu/theme.txt)

echo $theme

# Mostrar el menú con rofi
chosen=$(echo -e "$poweroff\n$reboot\n$logout\n$lock" | rofi -dmenu -no-custom -format "s" \
    -theme $theme -hide-scrollbar)
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
