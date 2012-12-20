#!/usr/bin/make -f

DH_VERBOSE=1

NAME= siduction-ridersonthestorm
SIZES= 640x480 800x600 1024x600 1024x768 1152x864 1280x720 1280x800 1280x1024 \
       1366x768 1440x900 1440x1050 1600x1200 1680x1050 1920x1080 1920x1200

all: clean prepare $(SIZES)

prepare:
	cp -a theme $(NAME)

$(SIZES):
	ln -sf /usr/share/wallpapers/$(NAME)/contents/images/$@.png $(NAME)/$@.png; \

clean:
	$(RM) -r $(NAME);
