#!/usr/bin/make -f

THEME= siduction-onestepbeyond
BITMAPS= files background 

all: $(BITMAPS)

files:
	mkdir ./$(THEME)
	# Alf  cp language.png $(THEME)/  //* FIXME *//
	cp GdmGreeterTheme.desktop $(THEME)/
	cp session.png $(THEME)/
	cp system.png $(THEME)/
	cp siduction-osb.xml $(THEME)/
	cp screenshot.png $(THEME)/

background:
	inkscape --without-gui --export-width=1920 --export-height=1200 \
		--export-png="./$(THEME)/$@.png" $@.svg

clean:
	$(RM) -r ./$(THEME)
