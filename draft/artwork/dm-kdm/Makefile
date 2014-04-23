#!/usr/bin/make -f

include VERSION
THEME= $(NAME)
BITMAPS= files background foreground footer header session system

all: $(BITMAPS)

files: clean
	ln -sf ../svg/background.jpg
	mkdir $(THEME)
	cp KdmGreeterTheme.desktop $(THEME)
	cp $(THEME).xml $(THEME)
	if [ -f screenshot.png ]; then \
	    cp -f screenshot.png $(THEME); \
	else \
	    echo "Please insert a real screenshot!"; \
	    cp dummyscreenshot.png $(THEME)/screenshot.png; \
	fi

background:
	ln -sf ../svg/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=1280 --export-height=1024 \
	    --export-png="$(THEME)/background.png" $@.svg

foreground:
	ln -sf ../svg/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=1280 --export-height=1024 \
	    --export-png="$(THEME)/foreground.png" $@.svg

footer:
	ln -sf ../svg/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=1280 --export-height=155 \
	   --export-png="$(THEME)/footer.png" $@.svg

header:
	ln -sf ../svg/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=1280 --export-height=78 \
		--export-png="$(THEME)/header.png" $@.svg

session:
	ln -sf ../svg/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=63 --export-height=67 \
		--export-png="$(THEME)/session.png" $@.svg

system:
	ln -sf ../svg/kdm-$@.svg $@.svg
	inkscape --without-gui --export-width=63 --export-height=67 \
		--export-png="$(THEME)/system.png" $@.svg

clean:
	$(RM) -r $(THEME)
	$(RM) *.svg
	$(RM) background.jpg
