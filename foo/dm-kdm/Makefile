#!/usr/bin/make -f

THEME= siduction-foo
BITMAPS= files background footer

all: $(BITMAPS)

files:
	mkdir $(THEME)
	cp session.png $(THEME)
	cp system.png $(THEME)
	cp KdmGreeterTheme.desktop $(THEME)
	cp siduction-foo.xml $(THEME)
	cp screenshot.png $(THEME)
	cp header.png $(THEME)

background:
	inkscape --without-gui --export-width=1920 --export-height=1200 \
		--export-png="$(THEME)/background.png" $@.svg

footer:
	inkscape --without-gui --export-width=1920 --export-height=107 \
		--export-png="$(THEME)/footer.png" $@.svg

clean:
	$(RM) -r $(THEME)
