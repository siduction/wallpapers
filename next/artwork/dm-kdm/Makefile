#!/usr/bin/make -f

include ../../VERSION
THEME= $(NAME)
BITMAPS= files background foreground footer header session system

all: $(BITMAPS)

files: clean
	mkdir $(THEME)
	cp KdmGreeterTheme.desktop $(THEME)
	cp $(THEME).xml $(THEME)
	cp screenshot.png $(THEME)

background:
	ln -sf ../SVG/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=1600 --export-height=1200 \
	    --export-png="$(THEME)/background.png" $@.svg
foreground:
	ln -sf ../SVG/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=1600 --export-height=1200 \
	    --export-png="$(THEME)/foreground.png" $@.svg
footer:
	ln -sf ../SVG/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=1600 --export-height=155 \
	   --export-png="$(THEME)/footer.png" $@.svg
header:
	ln -sf ../SVG/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=1920 --export-height=78 \
		--export-png="$(THEME)/header.png" $@.svg
session:
	ln -sf ../SVG/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=63 --export-height=67 \
		--export-png="$(THEME)/session.png" $@.svg
system:
	ln -sf ../SVG/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=63 --export-height=67 \
		--export-png="$(THEME)/system.png" $@.svg

clean:
	rm -rf $(THEME)
