#!/usr/bin/make -f

DH_VERBOSE=1

THEME= siduction-ridersonthestorm
CONTROLDIR= 1920x1200
SIZES= 640x480 800x600 1024x600 1024x768 1152x864 1280x720 1280x800 1280x1024 \
       1366x768 1440x900 1440x1050 1600x1200 1680x1050 1920x1080 1920x1200

all: prepare Preview background animation

prepare: clean
	$(RM) -r $(THEME)

	mkdir -p $(THEME)/$(CONTROLDIR)
	mkdir -p $(THEME)/1920x1080
	mkdir -p $(THEME)/1600x1200
	mkdir -p $(THEME)/1280x1024

	cp Theme.rc $(THEME)/
	cp description.txt $(THEME)/$(CONTROLDIR)

	ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/1920x1080/description.txt
	ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/1600x1200/description.txt
	ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/1280x1024/description.txt

	# prepare links to svg
	ln -sf ../SVG/kde-splash-ani-1.svg 1.svg
	ln -sf ../SVG/kde-splash-ani-2.svg 2.svg
	ln -sf ../SVG/kde-splash-ani-3.svg 3.svg
	ln -sf ../SVG/kde-splash-ani-4.svg 4.svg
	ln -sf ../SVG/kde-splash-1920x1200.svg 1920x1200.svg
	ln -sf ../SVG/kde-splash-1920x1080.svg 1920x1080.svg
	ln -sf ../SVG/kde-splash-1600x1200.svg 1600x1200.svg
	ln -sf ../SVG/kde-splash-1280x1024.svg 1280x1024.svg

Preview:
	inkscape --without-gui --export-width=300 --export-height=225 \
		--export-png="$(THEME)/$@.png" 1600x1200.svg

background:
	inkscape --without-gui --export-width=1280 --export-height=1024 \
		--export-png="$(THEME)/1280x1024/$@.png" 1600x1200.svg
	inkscape --without-gui --export-width=1600 --export-height=1200 \
		--export-png="$(THEME)/1600x1200/$@.png" 1600x1200.svg
	inkscape --without-gui --export-width=1920 --export-height=1080 \
		--export-png="$(THEME)/1920x1080/$@.png" 1920x1080.svg
	inkscape --without-gui \
		--export-png="$(THEME)/$(CONTROLDIR)/$@.png" 1920x1200.svg

animation:
	inkscape --without-gui \
		--export-png="$(THEME)/$(CONTROLDIR)/1.png" 1.svg
	inkscape --without-gui \
		--export-png="$(THEME)/$(CONTROLDIR)/2.png" 2.svg
	inkscape --without-gui \
		--export-png="$(THEME)/$(CONTROLDIR)/3.png" 3.svg
	inkscape --without-gui \
		--export-png="$(THEME)/$(CONTROLDIR)/4.png" 4.svg

	ln -s  ../$(CONTROLDIR)/1.png $(THEME)/1920x1080/1.png
	ln -s  ../$(CONTROLDIR)/1.png $(THEME)/1600x1200/1.png
	ln -s  ../$(CONTROLDIR)/1.png $(THEME)/1280x1024/1.png

	ln -s  ../$(CONTROLDIR)/2.png $(THEME)/1920x1080/2.png
	ln -s  ../$(CONTROLDIR)/2.png $(THEME)/1600x1200/2.png
	ln -s  ../$(CONTROLDIR)/2.png $(THEME)/1280x1024/2.png

	ln -s  ../$(CONTROLDIR)/3.png $(THEME)/1920x1080/3.png
	ln -s  ../$(CONTROLDIR)/3.png $(THEME)/1600x1200/3.png
	ln -s  ../$(CONTROLDIR)/3.png $(THEME)/1280x1024/3.png

	ln -s  ../$(CONTROLDIR)/4.png $(THEME)/1920x1080/4.png
	ln -s  ../$(CONTROLDIR)/4.png $(THEME)/1600x1200/4.png
	ln -s  ../$(CONTROLDIR)/4.png $(THEME)/1280x1024/4.png

clean:
	$(RM) -r $(THEME)
	$(RM) *.svg
