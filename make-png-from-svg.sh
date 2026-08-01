#!/bin/bash
#
# Run in the wallpaper folder
#

FORMATE_16x9=(1280x720 1366x768 1920x1080 2560x1440)
FORMATE_16x10=(1280x800 1440x900 1680x1050 1920x1200)
FORMATE_4x3=(1280x960 1400x1050 1600x1200 2048x1536)
FORMATE_4k=(4096x2160)
FORMATE_8k=(7680x4320)

mkdir png
mkdir png-dark
# mkdir png-xmas
# mkdir png-dark-xmas

# default

inkscape --export-filename=./png/background.png -w 1920 -h 1080 ./svg/Big-Crime-16x9.svg
inkscape --export-filename=./png/3840x2160.png -w 3840 -h 2160 ./svg/Big-Crime-16x9.svg
inkscape --export-filename=./png/2560x1600.png -w 2560 -h 1600 ./svg/Big-Crime-16x10.svg
inkscape --export-filename=./png/2732x2048.png -w 2732 -h 2048 ./svg/Big-Crime-4x3.svg
inkscape --export-filename=./png/4096x2160.png -w 4096 -h 2160 ./svg/Big-Crime-4k.svg
inkscape --export-filename=./png/7680x4320.png -w 7680 -h 4320 ./svg/Big-Crime-8k.svg

inkscape --export-filename=./png-dark/background.png -w 1920 -h 1080 ./svg-dark/Big-Crime-16x9.svg
inkscape --export-filename=./png-dark/3840x2160.png -w 3840 -h 2160 ./svg-dark/Big-Crime-16x9.svg
inkscape --export-filename=./png-dark/2560x1600.png -w 2560 -h 1600 ./svg-dark/Big-Crime-16x10.svg
inkscape --export-filename=./png-dark/2732x2048.png -w 2732 -h 2048 ./svg-dark/Big-Crime-4x3.svg
inkscape --export-filename=./png-dark/4096x2160.png -w 4096 -h 2160 ./svg-dark/Big-Crime-4k.svg
inkscape --export-filename=./png-dark/7680x4320.png -w 7680 -h 4320 ./svg-dark/Big-Crime-8k.svg

#rsvg-convert -w 1920 -h 1080 ./svg/Big-Crime-16x9.svg -o ./png/background.png
#rsvg-convert -w 3840 -h 2160 ./svg/Big-Crime-16x9.svg -o ./png/2560x2160.png
#rsvg-convert -w 2560 -h 1600 ./svg/Big-Crime-16x10.svg -o ./png/2560x1600.png
#rsvg-convert -w 2732 -h 2048 ./svg/Big-Crime-4x3.svg -o ./png/2732x2048.png
#rsvg-convert -w 4096 -h 2160 ./svg/Big-Crime-4k.svg -o ./png/4096x2160.png
#rsvg-convert -w 7680 -h 4320 ./svg/Big-Crime-8k.svg -o ./png/7680x4320.png

#rsvg-convert -w 1920 -h 1080 ./svg-dark/Big-Crime-16x9.svg -o ./png/background.png
#rsvg-convert -w 3840 -h 2160 ./svg-dark/Big-Crime-16x9.svg -o ./png/2560x2160.png
#rsvg-convert -w 2560 -h 1600 ./svg-dark/Big-Crime-16x10.svg -o ./png/2560x1600.png
#rsvg-convert -w 2732 -h 2048 ./svg-dark/Big-Crime-4x3.svg -o ./png/2732x2048.png
#rsvg-convert -w 4096 -h 2160 ./svg-dark/Big-Crime-4k.svg -o ./png/4096x2160.png
#rsvg-convert -w 7680 -h 4320 ./svg-dark/Big-Crime-8k.svg -o ./png/7680x4320.png

# x-mas
# convert -resize 1920x1080 ./x-mas/svg/Big-Crime-16x9.svg ./png-xmas/background.png
# convert -resize 3840x2160 ./x-mas/svg/Big-Crime-16x9.svg ./png-xmas/3840x2160.png
# convert -resize 2560x1600 ./x-mas/svg/Big-Crime-16x10.svg ./png-xmas/2560x1600.png
# convert -resize 2732x2048 ./x-mas/svg/Big-Crime-4x3.svg ./png-xmas/2732x2048.png
#
# convert -resize 1920x1080 ./x-mas/svg-dark/Big-Crime-16x9.svg ./png-dark-xmas/background.png
# convert -resize 3840x2160 ./x-mas/svg-dark/Big-Crime-16x9.svg ./png-dark-xmas/3840x2160.png
# convert -resize 2560x1600 ./x-mas/svg-dark/Big-Crime-16x10.svg ./png-dark-xmas/2560x1600.png
# convert -resize 2732x2048 ./x-mas/svg-dark/Big-Crime-4x3.svg ./png-dark-xmas/2732x2048.png

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
for r in ${FORMATE_4k[*]}; do
    convert -resize $r 4096x2160.png $r.png
done
unset r
for r in ${FORMATE_8k[*]}; do
    convert -resize $r 7680x4320.png $r.png
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
for r in ${FORMATE_4k[*]}; do
    convert -resize $r 4096x2160.png $r.png
done
unset r
for r in ${FORMATE_8k[*]}; do
    convert -resize $r 7680x4320.png $r.png
done
unset r

# x-mas
# cd ../png-xmas
#
# for r in ${FORMATE_16x9[*]}; do
#     convert -resize $r 3840x2160.png $r.png
# done
# unset r
# for r in ${FORMATE_16x10[*]}; do
#     convert -resize $r 2560x1600.png $r.png
# done
# unset r
# for r in ${FORMATE_4x3[*]}; do
#     convert -resize $r 2732x2048.png $r.png
# done
# unset r
#
# cd ../png-dark-xmas
#
# for r in ${FORMATE_16x9[*]}; do
#     convert -resize $r 3840x2160.png $r.png
# done
# unset r
# for r in ${FORMATE_16x10[*]}; do
#     convert -resize $r 2560x1600.png $r.png
# done
# unset r
# for r in ${FORMATE_4x3[*]}; do
#     convert -resize $r 2732x2048.png $r.png
# done
# unset r

exit 0
