#!/bin/bash

# License:
# Copyright (C) 2018 Pavel Dmitriev <dantalian.pv@gmail.com>
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.

# Dependencies: jemalloc compiled with enabled profiling

WORK_DIR=${1:-${WORK_DIR}}
LIB_PREFIX=${2:-${LIB_PREFIX}}
OPTS=${3:-${OPTS}}

if [ -n "$LIB_PREFIX" ]; then
	LIB_PREFIX="--lib_prefix=$LIB_PREFIX"
fi

if [ -n "$WORK_DIR" ]; then
	cd $WORK_DIR
fi

for item in $( find . -name 'jeprof.out.*.heap' -printf '%f\n'); do
	echo $item
    svg=app-${item%.heap}.svg
    echo $svg
    if ! [[ -f $svg ]]; then
        jeprof --inuse_space --svg $LIB_PREFIX $OPTS "$item" > $svg
        #jeprof --inuse_space --show_bytes --svg /usr/bin/java "$item" >$svg
        if [ ! -s $svg ] ; then
            echo removing zero size $svg
            rm $svg
        fi
    fi
done
