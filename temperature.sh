#!/bin/bash

# License:
# Copyright (C) 2018 Pavel Dmitriev <dantalian.pv@gmail.com>
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.

# Synopsis:
# The script check Raspbery PI CPU temperature
# and sends GUI notification to an administrator workstation
# if temperature is higher than defined $THRESHOLD
# The temperature is present as NN.NNN °C integer without dot

# Requirements:
# 1. ssh login to an administrator workstation without password
# 2. KDE or libnotify-tools / libnotify-bin installed

#Installation:
# 1. Make this script as executable with chmod +x temperature.sh
# 2. Add script to crontab to execute every minute:
#    */1 * * * *    user   /path/to/temperature.sh

THRESHOLD=60000

SSH_USER=user
SSH_HOST=host
KDE=false

TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)

if [ "$TEMP" -gt "$THRESHOLD" ]; then
    HTEMP=$(expr $TEMP / 1000) 
    if [ "$KDE" = "true" ]; then
        ssh "$SSH_USER"@"$SSH_HOST" 'DISPLAY=:0 kdialog --passivepopup "Raspberry PI. High temperature! '"$HTEMP"'°C" 3600'
    else
        ssh "$SSH_USER"@"$SSH_HOST" 'notify-send -u critical -t 3600000 "Raspberry PI" "High temperature! '"$HTEMP"'°C"'
    fi
fi
