#!/usr/bin/make -f

THEME= siduction-foo
BITMAPS= files background 

all: $(BITMAPS)

files:
	mkdir ./$(THEME)
	# Alf is nich da cp language.png $(THEME)/
	cp GdmGreeterTheme.desktop $(THEME)/
	cp session.png $(THEME)/
	cp system.png $(THEME)/
	cp siduction-foo.xml $(THEME)/
	cp screenshot.png $(THEME)/

background:
	inkscape --without-gui --export-width=1920 --export-height=1200 \
		--export-png="./$(THEME)/$@.png" $@.svg

clean:
	$(RM) -r ./$(THEME)
