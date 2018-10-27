#!/bin/bash

# License:
# Copyright (C) 2018 Pavel Dmitriev <dantalian.pv@gmail.com>
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.

BLOCKSIZE=1073741824

modprobe zram num_devices=4

echo $BLOCKSIZE > /sys/block/zram0/disksize
echo $BLOCKSIZE > /sys/block/zram1/disksize
echo $BLOCKSIZE > /sys/block/zram2/disksize
echo $BLOCKSIZE > /sys/block/zram3/disksize

mkswap -p 4096 /dev/zram0
mkswap -p 4096 /dev/zram1
mkswap -p 4096 /dev/zram2
mkswap -p 4096 /dev/zram3

swapon -p 100 /dev/zram0
swapon -p 100 /dev/zram1
swapon -p 100 /dev/zram2
swapon -p 100 /dev/zram3
