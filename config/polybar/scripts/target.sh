#!/bin/sh

ip_address=$(cat ~/.config/polybar/scripts/target | awk '{print$1}')
machine_name=$(cat ~/.config/polybar/scripts/target | awk '{print$2}')

if [ $ip_address ] && [ $machine_name ]; then
   echo "%{F#e51d0b}什 %{F#ffffff}$ip_address%{u-} - $machine_name %{F#e51d0b}什 %{F#ffffff}  "
else
   echo " "
fi
