#!/usr/bin/make -f

include VERSION
THEME= $(CODENNAME_SAFE)

all:
	./make-png-from-svg.sh
	mkdir -p build/${CODENAME_SAFE}
	cp metadata.* build/${CODENAME_SAFE}
	mkdir -p build/${CODENAME_SAFE}/contents/images
	mkdir -p build/${CODENAME_SAFE}/contents/images_dark
	cp png/*.png build/${CODENAME_SAFE}/contents/images/
	cp png-dark/*.png build/${CODENAME_SAFE}/contents/images_dark/
	rm -f png/*.png
	rm -f png-dark/*.png

clean:
	$(RM) -r build/
	$(RM) -r png/
	$(RM) -r png-dark/
