all:
	for i in  onestepbeyond onestepbeyond-lu-edition desperado; \
		do $(MAKE) -C $$i $@; done

clean:
	for i in  onestepbeyond onestepbeyond-lu-edition desperado; \
		do $(MAKE) -C $$i $@; done

distclean: clean
