#!/bin/bash


modprobe zram num_devices=4

echo 1073741824 > /sys/block/zram0/disksize
echo 1073741824 > /sys/block/zram1/disksize
echo 1073741824 > /sys/block/zram2/disksize
echo 1073741824 > /sys/block/zram3/disksize

mkswap -p 4096 /dev/zram0
mkswap -p 4096 /dev/zram1
mkswap -p 4096 /dev/zram2
mkswap -p 4096 /dev/zram3

swapon -p 100 /dev/zram0
swapon -p 100 /dev/zram1
swapon -p 100 /dev/zram2
swapon -p 100 /dev/zram3