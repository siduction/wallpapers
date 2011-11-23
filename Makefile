all:
	for i in  osb; \
		do $(MAKE) -C $$i $@; done

clean:
	for i in  osb; \
		do $(MAKE) -C $$i $@; done

distclean: clean
