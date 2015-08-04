#!/usr/bin/make -f

include VERSION
THEME= $(NAME)
SIZES= 640x480 800x600 1024x600 1024x768 1152x864 1280x720 1280x800 1280x1024 \
       1366x768 1440x900 1440x1050 1600x1200 1680x1050 1920x1080 1920x1200

all: $(SIZES) 400x250
	mkdir -p build/${NAME}
	cp metadata.desktop build/${NAME}


400x250:
	mkdir -p build/${NAME}/contents/
	$(RM) build/${NAME}/contents/screenshot.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
	    --export-height=$(lastword $(subst x, ,$@ )) \
	    --export-png="build/${NAME}/contents/screenshot.png" svg/1920x1200.svg
	convert -quality 90 "build/${NAME}/contents/screenshot.png" "build/${NAME}/contents/screenshot.jpg"
	$(RM) "build/${NAME}/contents/screenshot.png"

$(SIZES):
	mkdir -p build/${NAME}/contents/images/
	$(RM) build/${NAME}/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
	    --export-height=$(lastword $(subst x, ,$@ )) \
	    --export-png="build/${NAME}/contents/images/$@.png" svg/$@.svg
	convert -quality 90 "build/${NAME}/contents/images/$@.png" "build/${NAME}/contents/images/$@.jpg"
	$(RM) "build/${NAME}/contents/images/$@.png"

clean:
	$(RM) -r build/
