#!/usr/bin/make -f

include ../../VERSION
THEME= $(NAME)
BITMAPS= logo.png
SVG= logo.svg

all: clean $(BITMAPS)

$(BITMAPS):
	mkdir -p $(THEME)/balou
	inkscape --without-gui --export-width=1920 --export-height=1200 \
	    --export-png="$(THEME)/balou/$@" $(SVG)
	convert -quality 90 "$(THEME)/balou/logo.png" "$(THEME)/balou/logo.jpg"
	rm "$(THEME)/balou/logo.png"
	cp themerc $(THEME)/balou/

clean:
	$(RM) -r $(THEME)/
