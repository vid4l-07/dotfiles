#!/bin/bash

ip_address=$(cat ${HOME}/.config/bin/target | awk '{print $1}')
machine_name=$(cat ${HOME}/.config/bin/target | awk '{print $2}')

if [ $ip_address ] && [ $machine_name ]; then
    echo "󰓾 $ip_address - $machine_name"
elif [ $ip_address ]; then
    echo "󰓾 $ip_address"
else
    echo ""
fi
