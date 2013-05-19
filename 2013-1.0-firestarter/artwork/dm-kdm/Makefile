#!/usr/bin/make -f

include ../../VERSION
THEME= siduction-$(NAME)
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
	convert -quality 90 "$(THEME)/background.png" "$(THEME)/background.jpg"
	rm "$(THEME)/background.png"

foreground:
	ln -sf ../SVG/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=1600 --export-height=1200 \
	    --export-png="$(THEME)/foreground.png" $@.svg
	convert -quality 90 "$(THEME)/foreground.png" "$(THEME)/foreground.jpg"
	rm "$(THEME)/foreground.png"

footer:
	ln -sf ../SVG/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=1600 --export-height=76 \
	   --export-png="$(THEME)/footer.png" $@.svg
	convert -quality 90 "$(THEME)/footer.png" "$(THEME)/footer.jpg"
	rm "$(THEME)/footer.png"
		
header:
	ln -sf ../SVG/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=1920 --export-height=78 \
		--export-png="$(THEME)/header.png" $@.svg
		convert -quality 90 "$(THEME)/header.png" "$(THEME)/header.jpg"
	rm "$(THEME)/header.png"

session:
	ln -sf ../SVG/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=63 --export-height=67 \
		--export-png="$(THEME)/session.png" $@.svg
	convert -quality 90 "$(THEME)/session.png" "$(THEME)/session.jpg"
	rm "$(THEME)/session.png"

system:
	ln -sf ../SVG/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=63 --export-height=67 \
		--export-png="$(THEME)/system.png" $@.svg
	convert -quality 90 "$(THEME)/system.png" "$(THEME)/system.jpg"
	rm "$(THEME)/system.png"


clean:
	rm -rf $(THEME)
