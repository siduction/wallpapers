#!/usr/bin/make -f

include VERSION
THEME= $(CODENNAME_SAFE)
SIZES= 640x480 800x600 1024x600 1024x768 1152x864 1280x720 1280x800 1280x1024 \
       1366x768 1440x900 1440x1050 1600x1200 1680x1050 1920x1080 1920x1200

all: $(SIZES) 400x250
	mkdir -p build/${CODENAME_SAFE}
	cp metadata.desktop build/${CODENAME_SAFE}


400x250:
	mkdir -p build/${CODENAME_SAFE}/contents/
	$(RM) build/${CODENAME_SAFE}/contents/screenshot.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
	    --export-height=$(lastword $(subst x, ,$@ )) \
	    --export-png="build/${CODENAME_SAFE}/contents/screenshot.png" svg/1920x1200.svg
	convert -quality 90 "build/${CODENAME_SAFE}/contents/screenshot.png" "build/${CODENAME_SAFE}/contents/screenshot.jpg"
	$(RM) "build/${CODENAME_SAFE}/contents/screenshot.png"

$(SIZES):
	mkdir -p build/${CODENAME_SAFE}/contents/images/
	$(RM) build/${CODENAME_SAFE}/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
	    --export-height=$(lastword $(subst x, ,$@ )) \
	    --export-png="build/${CODENAME_SAFE}/contents/images/$@.png" svg/$@.svg
	convert -quality 90 "build/${CODENAME_SAFE}/contents/images/$@.png" "build/${CODENAME_SAFE}/contents/images/$@.jpg"
	$(RM) "build/${CODENAME_SAFE}/contents/images/$@.png"

clean:
	$(RM) -r build/
