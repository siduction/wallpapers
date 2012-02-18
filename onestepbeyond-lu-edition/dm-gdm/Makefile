#!/usr/bin/make -f

THEME= siduction-onestepbeyond-lu-edition
BITMAPS= files background 

all: $(BITMAPS)

files:
	mkdir ./$(THEME)
	xcp language.png $(THEME)/
	cp GdmGreeterTheme.desktop $(THEME)/
	cp session.png $(THEME)/
	cp system.png $(THEME)/
	cp siduction-onestepbeyond-lu-edition.xml $(THEME)/
	cp screenshot.png $(THEME)/

background:
	inkscape --without-gui --export-width=1920 --export-height=1200 \
		--export-png="./$(THEME)/$@.png" $@.svg

clean:
	$(RM) -r ./$(THEME)
