#!/usr/bin/make -f

DH_VERBOSE=1

NAME= siduction-paintitblack
SIZES= 1024x768 1366x768 1280x800 1280x1024 1440x900 1600x1200 1920x1080 1920x1200

all: clean
	cp -a theme $(NAME)
	for i in $(SIZES); do \
	    ln -sf /usr/share/wallpapers/$(NAME)/contents/images/$${i}.png $(NAME)/$${i}.png; \
	done
clean:
	for i in $(SIZES); do \
	    $(RM) -r $(NAME); \
	done
