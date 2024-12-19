#!/bin/bash
#
# Run in the wallpaper folder
#


FORMATE_16x9=(1280x720 1366x768 1920x1080 2560x1440)
FORMATE_16x10=(1280x800 1440x900 1680x1050 1920x1200)
FORMATE_4x3=(1280x960 1400x1050 1600x1200 2048x1536)

mkdir png
mkdir png-dark
mkdir png-xmas
mkdir png-dark-xmas

# default
convert -resize 1920x1080 ./svg/shineon-16x9.svg ./png/background.png
convert -resize 3840x2160 ./svg/shineon-16x9.svg ./png/3840x2160.png
convert -resize 2560x1600 ./svg/shineon-16x10.svg ./png/2560x1600.png
convert -resize 2732x2048 ./svg/shineon-4x3.svg ./png/2732x2048.png

convert -resize 1920x1080 ./svg-dark/shineon-16x9.svg ./png-dark/background.png
convert -resize 3840x2160 ./svg-dark/shineon-16x9.svg ./png-dark/3840x2160.png
convert -resize 2560x1600 ./svg-dark/shineon-16x10.svg ./png-dark/2560x1600.png
convert -resize 2732x2048 ./svg-dark/shineon-4x3.svg ./png-dark/2732x2048.png

# x-mas
convert -resize 1920x1080 ./x-mas/svg/shineon-16x9.svg ./png-xmas/background.png
convert -resize 3840x2160 ./x-mas/svg/shineon-16x9.svg ./png-xmas/3840x2160.png
convert -resize 2560x1600 ./x-mas/svg/shineon-16x10.svg ./png-xmas/2560x1600.png
convert -resize 2732x2048 ./x-mas/svg/shineon-4x3.svg ./png-xmas/2732x2048.png

convert -resize 1920x1080 ./x-mas/svg-dark/shineon-16x9.svg ./png-dark-xmas/background.png
convert -resize 3840x2160 ./x-mas/svg-dark/shineon-16x9.svg ./png-dark-xmas/3840x2160.png
convert -resize 2560x1600 ./x-mas/svg-dark/shineon-16x10.svg ./png-dark-xmas/2560x1600.png
convert -resize 2732x2048 ./x-mas/svg-dark/shineon-4x3.svg ./png-dark-xmas/2732x2048.png

# default
cd ./png

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

cd ../png-dark

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

# x-mas
cd ../png-xmas

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

cd ../png-dark-xmas

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
