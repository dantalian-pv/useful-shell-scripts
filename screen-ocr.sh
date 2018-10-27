#!/bin/bash

# License:
# Copyright (C) 2018 Pavel Dmitriev <dantalian.pv@gmail.com>
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3 of the License.
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.

# Dependencies: tesseract-ocr imagemagick scrot xclip

# select tesseract_lang in eng rus equ ;do break;done
# quick language menu, add more if you need other languages.

SCR_IMG=`mktemp`
#trap "rm $SCR_IMG*" EXIT

scrot -s $SCR_IMG.png -q 100    
# increase image quality with option -q from default 75 to 100

mogrify -modulate 100,0 -resize 400% $SCR_IMG.png 
#should increase detection rate

tesseract $SCR_IMG.png $SCR_IMG -l deu+eng -psm 3
xclip -selection clipboard $SCR_IMG.txt
 
rm $SCR_IMG $SCR_IMG.png $SCR_IMG.txt
