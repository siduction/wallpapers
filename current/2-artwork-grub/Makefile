#!/usr/bin/make -f

include VERSION

all: clean
	mkdir -p build/$(NAME)
	cp -a template/* build/$(NAME)

	sed -e s/\@NAME\@/\$(NAME)\/g \
	    ./template/theme.txt \
	    > ./build/${NAME}/theme.txt

clean:
	$(RM) -r build;
