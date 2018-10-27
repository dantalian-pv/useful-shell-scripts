# Useful bash scripts for different purposes
There is a list of bash scripts which you can use for different purposes.

## Scripts

### zram.sh

Creates 4 swap partitions by 1Gb each in RAM with some compression ratio.
Useful when you don't have enough RAM and don't want to deal swap on hard rive.
Minimum 8Gb RAM is required, otherwise it is quite pointless.

### screen-ocr.sh

Makes a screenshot of selected part of the screen, OCR it and puts text in the clipboard.
Very useful when you need to translate some text in the application, but text is not selectable, or can't be copied to the clipboard.

### temperature.sh

Useful only for Raspberry PI owners, but also can be rewritten to any other platform.

The script checks Raspberry PI CPU temperature and sends GUI notification to an administrator workstation if the temperature is higher than defined `$THRESHOLD`
