#!/bin/bash

ip_address=$(cat /home/vidikali/.config/bin/target | awk '{print $1}')
machine_name=$(cat /home/vidikali/.config/bin/target | awk '{print $2}')

if [ $ip_address ] && [ $machine_name ]; then
    echo "%{F#e51d0b}ﮊ %{F#ffffff}$ip_address%{u-} - $machine_name"
elif [ $ip_address ]; then
    echo "%{F#e51d0b}ﮊ %{F#ffffff}$ip_address%{u-}"
else
    echo "%{F#6CED74}%{F#ffffff} No target%{u-}"
fi
