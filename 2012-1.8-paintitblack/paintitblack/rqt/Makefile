#!/usr/bin/make -f

DH_VERBOSE=1

NAME= siduction-ridersonthestorm
SIZES= 1024x768 1366x768 1280x800 1280x1024 1440x900 1600x1200 1920x1080 1920x1200

#/usr/share/wallpapers/siduction-ridersonthestorm/contents/images$ ls
#1024x768.png  1280x1024.png  1280x800.png  1366x768.png  1440x900.png  1600x1200.png  1920x1080.png  1920x1200.png

all:  
	mkdir -p $(NAME)
	for i in $(SIZES); do \
	    ln -sf /usr/share/wallpapers/$(NAME)/contents/images/$${i}.png $(NAME)/$${i}.png; \
	done
clean: 
	for i in $(SIZES); do \
	    $(RM) -r "$(NAME)/$${i}.png"; \
	done
