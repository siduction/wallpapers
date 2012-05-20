#!/usr/bin/make -f

NAME= siduction
NAMEFOLDER= hicolor
SIZES= 8x8 16x16 22x22 24x24 32x32 36x36 45x45 48x48 64x64 72x72 96x96 128x128 160x160 192x192 256x256 512x512

all: $(SIZES)
	mkdir -p $(NAMEFOLDER)
	mkdir -p $(NAMEFOLDER)/scalable/apps
	cp $(NAME).svg $(NAMEFOLDER)/scalable/apps/

8x8:
	mkdir -p $(NAMEFOLDER)/8x8/apps/
	$(RM) $(NAMEFOLDER)/8x8/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/8x8/apps/$(NAME).png" $(NAME).svg

16x16:
	mkdir -p $(NAMEFOLDER)/16x16/apps/
	$(RM) $(NAMEFOLDER)/16x16/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/16x16/apps/$(NAME).png" $(NAME).svg

22x22:
	mkdir -p $(NAMEFOLDER)/22x22/apps/
	$(RM) $(NAMEFOLDER)/22x22/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/22x22/apps/$(NAME).png" $(NAME).svg		

24x24:
	mkdir -p $(NAMEFOLDER)/24x24/apps/
	$(RM) $(NAMEFOLDER)/24x24/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/24x24/apps/$(NAME).png" $(NAME).svg		

32x32:
	mkdir -p $(NAMEFOLDER)/32x32/apps/
	$(RM) $(NAMEFOLDER)/32x32/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/32x32/apps/$(NAME).png" $(NAME).svg

36x36:
	mkdir -p $(NAMEFOLDER)/36x36/apps/
	$(RM) $(NAMEFOLDER)/36x36/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/36x36/apps/$(NAME).png" $(NAME).svg
		
45x45:
	mkdir -p $(NAMEFOLDER)/45x45/apps/
	$(RM) $(NAMEFOLDER)/45x45/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/45x45/apps/$(NAME).png" $(NAME).svg
		
48x48:
	mkdir -p $(NAMEFOLDER)/48x48/apps/
	$(RM) $(NAMEFOLDER)/48x48/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/48x48/apps/$(NAME).png" $(NAME).svg
		
64x64:
	mkdir -p $(NAMEFOLDER)/64x64/apps/
	$(RM) $(NAMEFOLDER)/64x64/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/64x64/apps/$(NAME).png" $(NAME).svg
		
72x72:
	mkdir -p $(NAMEFOLDER)/72x72/apps/
	$(RM) $(NAMEFOLDER)/72x72/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/72x72/apps/$(NAME).png" $(NAME).svg
		
96x96:
	mkdir -p $(NAMEFOLDER)/96x96/apps/
	$(RM) $(NAMEFOLDER)/96x96/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/96x96/apps/$(NAME).png" $(NAME).svg
		
128x128:
	mkdir -p $(NAMEFOLDER)/128x128/apps/
	$(RM) $(NAMEFOLDER)/128x128/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/128x128/apps/$(NAME).png" $(NAME).svg
		
160x160:
	mkdir -p $(NAMEFOLDER)/160x160/apps/
	$(RM) $(NAMEFOLDER)/160x160/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/160x160/apps/$(NAME).png" $(NAME).svg

192x192:
	mkdir -p $(NAMEFOLDER)/192x192/apps/
	$(RM) $(NAMEFOLDER)/192x192/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/192x192/apps/$(NAME).png" $(NAME).svg

256x256:
	mkdir -p $(NAMEFOLDER)/256x256/apps/
	$(RM) $(NAMEFOLDER)/256x256/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/256x256/apps/$(NAME).png" $(NAME).svg
		
512x512:
	mkdir -p $(NAMEFOLDER)/512x512/apps/
	$(RM) $(NAMEFOLDER)/512x512/apps/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
		--export-height=$(lastword $(subst x, ,$@ )) \
		--export-png="$(NAMEFOLDER)/512x512/apps/$(NAME).png" $(NAME).svg

clean:
	$(RM) -r $(NAMEFOLDER)/
