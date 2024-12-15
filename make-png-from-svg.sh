#!/bin/bash
#
# Run in the wallpaper folder
# 

FORMATE_16x9=(1280x720 1366x768 1920x1080 2560x1440)
FORMATE_16x10=(1280x800 1440x900 1680x1050 1920x1200)
FORMATE_4x3=(1280x960 1400x1050 1600x1200 2048x1536)

cd ./svg

#convert -resize 1920x1080 shineon-16x9.svg ../png/background.png
#convert -resize 400x250 shineon-16x9.svg ../png/screenshot.png

convert -resize 3840x2160 shineon-16x9.svg ../png/3840x2160.png
convert -resize 2560x1600 shineon-16x10.svg ../png/2560x1600.png
convert -resize 2732x2048 shineon-4x3.svg ../png/2732x2048.png

cd ../png

for r in ${FORMATE_16x9[*]}; do
    convert -resize $r 3840x2160.png $r.png
done
unset r
for r in ${FORMATE_16x10[*]}; do
    convert -resize $r 2560x1600.png $r.png
done
unset r
for r in ${FORMATE_4x3[*]}; do
    convert -resize $r 2732x2048.png $r.png
done
unset r

exit 0
