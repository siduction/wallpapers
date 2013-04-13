#!/usr/bin/make -f

include ../../VERSION
THEME= siduction-$(NAME)
BITMAPS= files background foreground footer

all: $(BITMAPS)

files: clean
	mkdir $(THEME)
	cp session.png $(THEME)
	cp system.png $(THEME)
	cp KdmGreeterTheme.desktop $(THEME)
	cp $(THEME).xml $(THEME)
	cp screenshot.png $(THEME)
	cp header.png $(THEME)

background:
	inkscape --without-gui --export-width=1600 --export-height=1200 \
	    --export-png="$(THEME)/background.png" $@.svg
	convert -quality 90 "$(THEME)/background.png" "$(THEME)/background.jpg"
	rm "$(THEME)/background.png"

foreground:
	inkscape --without-gui --export-width=1600 --export-height=1200 \
	    --export-png="$(THEME)/foreground.png" $@.svg
	convert -quality 90 "$(THEME)/foreground.png" "$(THEME)/foreground.jpg"
	rm "$(THEME)/foreground.png"

footer:
	inkscape --without-gui --export-width=1600 --export-height=155 \
	   --export-png="$(THEME)/footer.png" $@.svg
	convert -quality 90 "$(THEME)/footer.png" "$(THEME)/footer.jpg"
	rm "$(THEME)/footer.png"

clean:
	rm -rf $(THEME)
