# Useful bash scripts for different purposes
There is a list of bash scripts which you can use for different purposes.

## Scripts

### zram.sh

Creates 4 swap partitions by 1Gb each in RAM with some compression ratio.
Useful when you don't have enough RAM and don't want to deal with swap on hard rive.
Minimum 8Gb RAM is required, otherwise it is quite pointless.

### screen-ocr.sh

Makes a screenshot of selected part of the screen, OCR it and puts text in the clipboard.
Very useful when you need to translate some text in the application, but text is not selectable, or can't be copied to the clipboard.

### temperature.sh

Useful only for Raspberry PI owners, but also can be rewritten to any other platform.

The script checks Raspberry PI CPU temperature and sends GUI notification to an administrator workstation if the temperature is higher than defined `$THRESHOLD`

### jemalloc_profiling.sh

Convert jeprof.heap files, made by jemalloc library into svg graph.
For further details about jemalloc visit http://jemalloc.net/
Jemalloc generates multiple files during application run, and this scripts converts every heap file into single svg file.

Before run:

1. Install all debug information for all libraries used by application
2. Compile on istall jemalloc with enabled profiling

Run:

1. Run you application with env variables: `LD_PRELOAD=/path/to/libjemalloc.so.1 -e MALLOC_CONF=prof:true,prof_prefix:/path/to/jeprof.out`

Analyse:

1. Convert all heap files using jemalloc_profiling.sh into svg and look at them to see mem leak.
