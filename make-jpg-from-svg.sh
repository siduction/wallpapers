#!/bin/bash
#
# Run in the wallpaper folder
# 

FORMATE_16x9=(1280x720 1366x768 1920x1080 2560x1440 3840x2160)
FORMATE_16x10=(1280x800 1440x900 1680x1050 1920x1200 2560x1600)
FORMATE_4x3=(1280x960 1400x1050 1600x1200 2048x1536 2732x2048)
FORMATE_4k=(4096x2160)
FORMATE_8k=(7680x4320)

mkdir jpg
mkdir jpg-dark

cd ./svg
for i in $(basename -s .svg *.svg); do

	f=$(echo $i | sed s'!.*-!!')

	case $f in
	"16x9")
		for r in ${FORMATE_16x9[*]}; do
			convert -resize $r $i.svg ../jpg/$r.jpg
		done
		unset r
		;;
	"16x10")
		for r in ${FORMATE_16x10[*]}; do
			convert -resize $r $i.svg ../jpg/$r.jpg
		done
		unset r
		;;
	"4x3")
		for r in ${FORMATE_4x3[*]}; do
			convert -resize $r $i.svg ../jpg/$r.jpg
		done
		unset r
		;;
	"4k")
		for r in ${FORMATE_4k[*]}; do
			convert -resize $r $i.svg ../jpg/$r.jpg
		done
		unset r
		;;
	"8k")
		for r in ${FORMATE_8k[*]}; do
			convert -resize $r $i.svg ../jpg/$r.jpg
		done
		unset r
		;;
	esac
done

cd ../svg-dark
for i in $(basename -s .svg *.svg); do

	f=$(echo $i | sed s'!.*-!!')

	case $f in
	"16x9")
		for r in ${FORMATE_16x9[*]}; do
			convert -resize $r $i.svg ../jpg-dark/$r.jpg
		done
		unset r
		;;
	"16x10")
		for r in ${FORMATE_16x10[*]}; do
			convert -resize $r $i.svg ../jpg-dark/$r.jpg
		done
		unset r
		;;
	"4x3")
		for r in ${FORMATE_4x3[*]}; do
			convert -resize $r $i.svg ../jpg-dark/$r.jpg
		done
		unset r
		;;
	"4k")
		for r in ${FORMATE_4k[*]}; do
			convert -resize $r $i.svg ../jpg-dark/$r.jpg
		done
		unset r
		;;
	"8k")
		for r in ${FORMATE_8k[*]}; do
			convert -resize $r $i.svg ../jpg-dark/$r.jpg
		done
		unset r
		;;
	esac
done
exit 0
