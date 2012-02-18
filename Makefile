all:
	for i in  onestepbeyond-lu-edition; \
		do $(MAKE) -C $$i $@; done

clean:
	for i in  onestepbeyond-lu-edition; \
		do $(MAKE) -C $$i $@; done

distclean: clean
