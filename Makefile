all:
	for i in 11.0.5; \
		do $(MAKE) -C $$i $@; done

clean:
	for i in 11.0.5; \
		do $(MAKE) -C $$i $@; done

distclean: clean
