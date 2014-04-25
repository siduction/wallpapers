#!/usr/bin/make -f

include ../../VERSION
THEME= $(NAME)
CONTROLDIR= 1920x1200

all: prepare background animation Preview

prepare: clean
	$(RM) -r $(THEME)

	mkdir -p $(THEME)/$(CONTROLDIR)
	mkdir -p $(THEME)/1600x1200
	mkdir -p $(THEME)/1280x1024
	mkdir -p $(THEME)/1024x768

	cp Theme.rc $(THEME)/
#	cp ksplash-preview.png $(THEME)/Preview.png
	cp description.txt $(THEME)/$(CONTROLDIR)

	ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/1600x1200/description.txt
	ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/1280x1024/description.txt
	ln -s  ../$(CONTROLDIR)/description.txt $(THEME)/1024x768/description.txt

	# prepare links to svg
	ln -sf ../svg/screenshot-ksplash.svg preview.svg
	ln -sf ../svg/kde-splash-ani.svg ani.svg
	ln -sf ../svg/kde-splash-ani-0.svg 0.svg
	ln -sf ../svg/kde-splash-ani-1.svg 1.svg
	ln -sf ../svg/kde-splash-ani-2.svg 2.svg
	ln -sf ../svg/kde-splash-ani-3.svg 3.svg
	ln -sf ../svg/kde-splash-ani-4.svg 4.svg
	ln -sf ../svg/background.jpg
	ln -sf ../svg/kde-splash-1920x1200.svg 1920x1200.svg
	ln -sf ../svg/kde-splash-1600x1200.svg 1600x1200.svg
	ln -sf ../svg/kde-splash-1280x1024.svg 1280x1024.svg
	ln -sf ../svg/kde-splash-1024x768.svg  1024x768.svg

Preview:
	inkscape --without-gui --export-width=300 --export-height=225 \
	    --export-png="$(THEME)/$@.png" preview.svg
background:
	inkscape --without-gui --export-width=1024 --export-height=768 \
	    --export-png="$(THEME)/1024x768/$@.png" 1024x768.svg
	inkscape --without-gui --export-width=1280 --export-height=1024 \
	    --export-png="$(THEME)/1280x1024/$@.png" 1280x1024.svg
	inkscape --without-gui --export-width=1600 --export-height=1200 \
	    --export-png="$(THEME)/1600x1200/$@.png" 1600x1200.svg
	inkscape --without-gui \
	    --export-png="$(THEME)/$(CONTROLDIR)/$@.png" 1920x1200.svg
animation:
	# inkscape --without-gui \
	#     --export-png="$(THEME)/$(CONTROLDIR)/0.png" 0.svg
	inkscape --without-gui \
	    --export-png="$(THEME)/$(CONTROLDIR)/ani.png" ani.svg
	inkscape --without-gui \
	    --export-png="$(THEME)/$(CONTROLDIR)/0.png" 0.svg
	inkscape --without-gui \
	    --export-png="$(THEME)/$(CONTROLDIR)/1.png" 1.svg
	inkscape --without-gui \
	    --export-png="$(THEME)/$(CONTROLDIR)/2.png" 2.svg
	inkscape --without-gui \
	   --export-png="$(THEME)/$(CONTROLDIR)/3.png" 3.svg
	inkscape --without-gui \
	   --export-png="$(THEME)/$(CONTROLDIR)/4.png" 4.svg
#	inkscape --without-gui \
#	   --export-png="$(THEME)/$(CONTROLDIR)/5.png" 5.svg

	ln -s  ../$(CONTROLDIR)/0.png $(THEME)/1600x1200/0.png
	ln -s  ../$(CONTROLDIR)/0.png $(THEME)/1280x1024/0.png
	ln -s  ../$(CONTROLDIR)/0.png $(THEME)/1024x768/0.png

	ln -s  ../$(CONTROLDIR)/1.png $(THEME)/1600x1200/1.png
	ln -s  ../$(CONTROLDIR)/1.png $(THEME)/1280x1024/1.png
	ln -s  ../$(CONTROLDIR)/1.png $(THEME)/1024x768/1.png

	ln -s  ../$(CONTROLDIR)/2.png $(THEME)/1600x1200/2.png
	ln -s  ../$(CONTROLDIR)/2.png $(THEME)/1280x1024/2.png
	ln -s  ../$(CONTROLDIR)/2.png $(THEME)/1024x768/2.png

	ln -s  ../$(CONTROLDIR)/3.png $(THEME)/1600x1200/3.png
	ln -s  ../$(CONTROLDIR)/3.png $(THEME)/1280x1024/3.png
	ln -s  ../$(CONTROLDIR)/3.png $(THEME)/1024x768/3.png

	ln -s  ../$(CONTROLDIR)/4.png $(THEME)/1600x1200/4.png
	ln -s  ../$(CONTROLDIR)/4.png $(THEME)/1280x1024/4.png
	ln -s  ../$(CONTROLDIR)/4.png $(THEME)/1024x768/4.png
	
	ln -s  ../$(CONTROLDIR)/ani.png $(THEME)/1600x1200/ani.png
	ln -s  ../$(CONTROLDIR)/ani.png $(THEME)/1280x1024/ani.png
	ln -s  ../$(CONTROLDIR)/ani.png $(THEME)/1024x768/ani.png

clean:
	$(RM) -r $(THEME)
	$(RM) *.svg
	$(RM) background.jpg
