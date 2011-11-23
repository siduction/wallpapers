#!/usr/bin/make -f

THEME= siduction-11.0.5
BITMAPS= logo.png
SVG= logo.svg


all: $(BITMAPS)

logo.png:
	mkdir -p $(THEME)/balou
	inkscape --without-gui --export-width=640 --export-height=480 \
		--export-png="$(THEME)/balou/$@" $(SVG)
	cp themerc $(THEME)/balou/
clean:
	$(RM) -r $(THEME)/
