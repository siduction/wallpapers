#!/usr/bin/make -f

include ../../VERSION
THEME= siduction-$(NAME)
SIZES= 640x480 800x600 1024x600 1024x768 1152x864 1280x720 1280x800 1280x1024 \
       1366x768 1440x900 1440x1050 1600x1200 1680x1050 1920x1080 1920x1200

all: clean $(SIZES)

$(SIZES):
	ln -sf ../SVG/lightdm-$@.svg $@.svg
	mkdir -p $(THEME)/background
	$(RM) $(THEME)/background/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(THEME)/background/$@.png" $@.svg
	convert -quality 90 "$(THEME)/background/$@.png" "$(THEME)/background/$@.jpg"
	rm "$(THEME)/background/$@.png"


clean:
	$(RM) -r $(THEME)/
	$(RM) *.svg
