#!/usr/bin/make -f

SIZE= 8 16 22 24 32 48 64 72 96 128 256
ICON=siduction

all:
	# requires inkscape and imagemagick to be installed
	@if [ ! -x /usr/bin/convert ]; then \
	    echo "ERROR: imagemagick not installed!" ; \
	    false ; \
	fi
	
	@if [ ! -x /usr/bin/inkscape ]; then \
	    echo "ERROR: inkscape not installed!" ; \
	    false ; \
	fi
 
	# create XDG compatible icons from SVG
	for i in ${SIZE}; do \
	    mkdir -p "hicolor/$${i}x$${i}/apps" ; \
	        inkscape --export-width=$${i} \
	            --export-height=$${i} \
	            --export-png="$(CURDIR)/hicolor/$${i}x$${i}/apps/${ICON}.png" \
	                $(CURDIR)/${ICON}.svg ; \
	done

	mkdir -p pixmaps
	convert hicolor/32x32/apps/${ICON}.png pixmaps/${ICON}.xpm
	convert hicolor/16x16/apps/${ICON}.png pixmaps/${ICON}-16.xpm
	
	mkdir -p hicolor/scalable
	cp ${ICON}.svg hicolor/scalable

clean:
	$(RM) -r hicolor
	$(RM) -r pixmaps
