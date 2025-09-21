#!/usr/bin/env sh

polybar=$(/bin/cat ${HOME}/.config/bin/polybar)

if ! pgrep -x polybar; then
    polybar -c $polybar'1.ini' polybar >/dev/null
    polybar -c $polybar'2.ini' polybar >/dev/null
else
    pkill -USR1 polybar
fi
