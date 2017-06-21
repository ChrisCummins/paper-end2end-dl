.DEFAULT_GOAL = help

SHELL = /bin/bash

.PHONY: clean help

essential_archives = \
	case-study-a/kernels \
	$(NULL)

all_archives = \
	$(essential_archives) \
	case-study-a/kernels \
	case-study-a/models \
	case-study-a/predictions \
	case-study-b/models \
	case-study-b/predictions \
	$(NULL)

essential: $(essential_archives)

all: $(all_archives)

case-study-a/kernels: case-study-a/kernels.tar.bz2
	cd $(dir $<) && tar xjf $(notdir $<)
	touch $@

case-study-a/models: case-study-a/our-models.tar.bz2
	cd $(dir $<) && tar xjf $(notdir $<)
	touch $@

case-study-a/predictions: case-study-a/our-predictions.tar.bz2
	cd $(dir $<) && tar xjf $(notdir $<)
	touch $@

case-study-b/our-models.tar.bz2: case-study-b/our-models-aa case-study-b/our-models-ab
	cat $< > $@

refresh:
	$(MAKE) clean
	$(MAKE) essential

clean:
	rm -fr $(all_archives)

help:
	@echo "usage: make {essential,all,refresh,clean}"
	@echo
	@echo "See ../code/README.md for details"
