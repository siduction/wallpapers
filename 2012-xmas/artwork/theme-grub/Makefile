#!/usr/bin/make -f

DH_VERBOSE=1

NAME= siduction-xmas
SIZES= 640x480 800x600 1024x600 1024x768 1152x864 1280x720 1280x800 1280x1024 \
       1366x768 1440x900 1440x1050 1600x1200 1680x1050 1920x1080 1920x1200

all: clean $(SIZES)
	mkdir -p $(NAME)
	cp -a template/* $(NAME)
	$(RM) $(NAME)/theme.txt 

$(SIZES):
	ln -sf ../SVG/grub-$@.svg $@.svg
	mkdir -p $(NAME)
	sed -e s/\@SIZE\@/\"$(NAME)-$@.png\"/g \
	    ./template/theme.txt \
	    > ./${NAME}/theme-$@.txt

	$(RM) $(NAME)/$(NAME)-$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
	        --export-height=$(lastword $(subst x, ,$@ )) \
	        --export-png="$(NAME)/$(NAME)-$@.png" $@.svg
	
clean:
	$(RM) -r $(NAME); 
	$(RM) *.svg
