#!/usr/bin/env bash

# CMDs
#uptime_info=$(uptime -p | sed -e 's/up //g')
host=$(hostnamectl hostname)

# Options with Icons and Text
options=("Shutdown" "Reboot" "Logout" "Lock")
icons=("" "" "" "")
# Rofi CMD
rofi_cmd() {
    options_with_icons=()
    for ((i = 0; i < ${#options[@]}; i++)); do
        options_with_icons+=("${icons[$i]} ${options[$i]}")
    done

    chosen_option=$(printf "%s\n" "${options_with_icons[@]}" | \
	rofi -dmenu -i -p " $USER@$host" -mesg " Uptime: $uptime_info" \
	-kb-select-1 "s" \
	-kb-select-2 "r" \
	-kb-select-3 "e" \
	-kb-select-4 "l" \
	-theme ~/.config/rofi/config-powermenu.rasi | awk '{print $1}')
}

# Execute Command
run_cmd() {
    case $1 in
        "l")
            swaylock
            ;;
        "e")
            hyprctl dispatch exit 0
            ;;
        "r")
            systemctl reboot
            ;;
        "s")
            systemctl poweroff
            ;;
        *)
            echo "choose: $1"
            ;;
    esac
}

# Actions
chosen_option=$(rofi_cmd)
run_cmd "${chosen_option% *}"
