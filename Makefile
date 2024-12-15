#!/usr/bin/make -f

include VERSION
THEME= $(CODENNAME_SAFE)

all:
	./make-png-from-svg.sh
	mkdir -p build/${CODENAME_SAFE}
	cp metadata.* build/${CODENAME_SAFE}
	mkdir -p build/${CODENAME_SAFE}/contents/images
	cp png/*.png build/${CODENAME_SAFE}/contents/images
	rm -f png/*.png

clean:
	$(RM) -r build/
