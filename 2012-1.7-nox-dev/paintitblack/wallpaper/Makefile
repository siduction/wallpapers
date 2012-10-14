#!/usr/bin/make -f

NAME= siduction-paintitblack
NORMAL= 1600x1280.svg
MEDIUM= 1600x1200.svg
WIDE= 1920x1200.svg
REALLYWIDE= 1920x1080.svg
GRUB= grub.svg
SIZES= 400x250 1024x768 1366x768 1280x800 1280x1024 1440x900 1600x1200 1920x1080 1920x1200 grub

all: $(SIZES)
	mkdir -p $(NAME)
	cp metadata.desktop $(NAME)/

400x250:
	mkdir -p $(NAME)/contents/
	$(RM) $(NAME)/contents/screenshot.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAME)/contents/screenshot.png" $(WIDE)

1280x1024:
	mkdir -p $(NAME)/contents/images/
	$(RM) $(NAME)/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAME)/contents/images/$@.png" $(NORMAL)

1024x768 1600x1200:
	mkdir -p $(NAME)/contents/images/
	$(RM) $(NAME)/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAME)/contents/images/$@.png" $(NORMAL)

1280x800 1440x900 1920x1200:
	mkdir -p $(NAME)/contents/images/
	$(RM) $(NAME)/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAME)/contents/images/$@.png" $(WIDE)

1366x768 1920x1080:
	mkdir -p $(NAME)/contents/images/
	$(RM) $(NAME)/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAME)/contents/images/$@.png" $(REALLYWIDE)

grub:
	mkdir -p $(NAME)/grub/
	$(RM) $(NAME)/contents/images/$@*.png
	inkscape --without-gui --export-width=640 \
		 --export-height=480 \
		 --export-png="$(NAME)/grub/$@640.png" $(GRUB)
	inkscape --without-gui --export-width=800 \
		--export-height=600 \
		 --export-png="$(NAME)/grub/$@800.png" $(GRUB)

clean:
	$(RM) -r $(NAME)/
