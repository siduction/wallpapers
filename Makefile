#!/usr/bin/make -f

include VERSION
THEME=$(CODENNAME_SAFE)

all:
	./make-png-from-svg.sh
	mkdir -p build/${CODENAME_SAFE}
	mkdir -p build/${CODENAME_SAFE}-xmas
	cp metadata.json build/${CODENAME_SAFE}
	cp metadata-xmas.json build/${CODENAME_SAFE}-xmas/metadata.json
	mkdir -p build/${CODENAME_SAFE}/contents/images
	mkdir -p build/${CODENAME_SAFE}/contents/images_dark
	mkdir -p build/${CODENAME_SAFE}-xmas/contents/images
	mkdir -p build/${CODENAME_SAFE}-xmas/contents/images_dark
	cp png/*.png build/${CODENAME_SAFE}/contents/images/
	cp png-dark/*.png build/${CODENAME_SAFE}/contents/images_dark/
	cp png-xmas/*.png build/${CODENAME_SAFE}-xmas/contents/images/
	cp png-dark-xmas/*.png build/${CODENAME_SAFE}-xmas/contents/images_dark/
	rm -f png/*.png
	rm -f png-dark/*.png
	rm -f png-xmas/*.png
	rm -f png-dark-xmas/*.png

clean:
	$(RM) -r build/
	$(RM) -r png/
	$(RM) -r png-dark/
	$(RM) -r png-xmas/
	$(RM) -r png-dark-xmas/
