#!/usr/bin/make -f

THEME= siduction-11.0.5
BITMAPS= files background

all: $(BITMAPS)

files:
	mkdir $(THEME)
	cp session.png $(THEME)
	cp system.png $(THEME)
	cp KdmGreeterTheme.desktop $(THEME)
	cp siduction-11.0.5.xml $(THEME)
	cp screenshot.png $(THEME)

background:
	inkscape --without-gui --export-width=1920 --export-height=1200 \
		--export-png="$(THEME)/background.png" $@.svg

clean:
	$(RM) -r $(THEME)
