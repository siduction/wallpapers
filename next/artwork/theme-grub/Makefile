#!/usr/bin/make -f

DH_VERBOSE=1

include ../../VERSION
THEME= $(NAME)
SIZES= 640x480 800x600 1024x600 1024x768 1152x864 1280x720 1280x800 1280x1024 \
       1366x768 1440x900 1440x1050 1600x1200 1680x1050 1920x1080 1920x1200

all: clean background $(SIZES)
	cp -a template/* $(THEME)
	$(RM) $(THEME)/theme.txt

background:
	ln -sf ../svg/background.jpg

$(SIZES):
	ln -sf ../svg/grub-$@.svg $@.svg
	mkdir -p $(THEME)
	sed -e s/\@SIZE\@/\"$(THEME)-$@.png\"/g \
	    ./template/theme.txt \
	    > ./${THEME}/theme-$@.txt

	$(RM) $(THEME)/$(THEME)-$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
	        --export-height=$(lastword $(subst x, ,$@ )) \
	        --export-png="$(THEME)/$(THEME)-$@.png" $@.svg
	convert -quality 90 "$(THEME)/$(THEME)-$@.png" "$(THEME)/$(THEME)-$@.jpg"
	rm "$(THEME)/$(THEME)-$@.png"

clean:
	$(RM) -r $(THEME);
	$(RM) *.svg
	$(RM) background.jpg
