all:
	for i in  foo 11.0.5; \
		do $(MAKE) -C $$i $@; done

clean:
	for i in  foo 11.0.5; \
		do $(MAKE) -C $$i $@; done

distclean: clean
