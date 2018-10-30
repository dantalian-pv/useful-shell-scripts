#!/bin/bash

# License:
# Copyright (C) 2018 Pavel Dmitriev <dantalian.pv@gmail.com>
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.

BLOCKSIZE=1073741824
DEVICES=4

modprobe zram num_devices=$DEVICES

for (( I=0; I<$DEVICES; I++ )); do
    echo $BLOCKSIZE > /sys/block/zram${I}/disksize
done

for (( I=0; I<$DEVICES; I++ )); do
    mkswap -p 4096 /dev/zram${I}
done

for (( I=0; I<$DEVICES; I++ )); do
    swapon -p 100 /dev/zram${I}
done
