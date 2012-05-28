#!/usr/bin/make -f

NAME= razorqt
NAMEMEDIUM= $(NAME)-medium
NAMEWIDE= $(NAME)-wide
NAMEREALLYWIDE= $(NAME)-really-wide
NAMEGRUB= $(NAME)-grub
SIZES= 1024x768 1366x768 1280x800 1280x1024 1440x900 1600x1200 1920x1080 1920x1200


all: $(SIZES)

1024x768 1600x1200:
	$(RM) themes/$(NAME)_$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="themes/$(NAME)_$@.png" $(NAME).svg
1280x1024:
	$(RM) themes/$(NAME)_$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="themes/$(NAME)_$@.png" $(NAMEMEDIUM).svg

1280x800 1440x900 1920x1200:
	$(RM) themes/$(NAME)_$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="themes/$(NAME)_$@.png" $(NAMEWIDE).svg

1366x768 1920x1080:
	$(RM) themes/$(NAME)_$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="themes/$(NAME)_$@.png" $(NAMEREALLYWIDE).svg

clean: 
	for i in $(SIZES); do \
	    $(RM) -r "themes/$(NAME)_$${i}.png"; \
	done
