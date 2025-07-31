#!/bin/sh

IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')

if [ "$IFACE" = "tun0" ]; then
		echo "%{F#6CED74}嬨%{F#ffffff} $(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')%{u-}"
else
	echo "%{F#6CED74}嬨%{F#ffffff} Disconnected%{u-}"
fi

