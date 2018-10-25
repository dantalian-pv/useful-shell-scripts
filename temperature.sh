#!/bin/bash

THRESHOLD=60000

TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
# echo $TEMP
if [ "$TEMP" -gt "$THRESHOLD" ]; then
    # notify-send requires libnotify-tools
    #ssh user@host 'notify-send "High temperature! '"$TEMP"'"'
    # For KDE users
    ssh user@host 'DISPLAY=:0 kdialog --passivepopup "High temperature! '"$TEMP"'"'
fi
