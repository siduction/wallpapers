#!/usr/bin/make -f

THEME= siduction-11.0.5
BITMAPS= files background 11.0.5

all: $(BITMAPS)

files:
	mkdir ./$(THEME)
	cp language.png $(THEME)/
	cp GdmGreeterTheme.desktop $(THEME)/
	cp session.png $(THEME)/
	cp system.png $(THEME)/
	cp siduction-11.0.5.xml $(THEME)/
	cp screenshot.png $(THEME)/

background:
	inkscape --without-gui --export-width=1920 --export-height=1200 \
		--export-png="./$(THEME)/$@.png" $@.svg

#fred:
	inkscape --without-gui --export-width=94 --export-height=100 \
		--export-png="./$(THEME)/$@.png" $@.svg

clean:
	$(RM) -r ./$(THEME)
