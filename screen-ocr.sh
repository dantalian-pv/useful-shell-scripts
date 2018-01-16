#!/bin/bash 
# Dependencies: tesseract-ocr imagemagick scrot xclip

# select tesseract_lang in eng rus equ ;do break;done
# quick language menu, add more if you need other languages.

SCR_IMG=`mktemp`
#trap "rm $SCR_IMG*" EXIT

scrot -s $SCR_IMG.png -q 100    
# increase image quality with option -q from default 75 to 100

mogrify -modulate 100,0 -resize 400% $SCR_IMG.png 
#should increase detection rate

tesseract $SCR_IMG.png $SCR_IMG -l deu+eng -psm 1
xclip $SCR_IMG.txt
 
rm $SCR_IMG $SCR_IMG.png $SCR_IMG.txt
