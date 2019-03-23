ACTIONS = $(filter-out docs/ rust-relaser/ recipes/, $(wildcard */))

LIBS = $(addsuffix lib.sh,$(ACTIONS))

all: | $(LIBS) rust-releaser lint

lint:
	echo $(ACTIONS)
	act

$(LIBS) : lib.sh
	cp $< $@

rust-relaser:
	$(MAKE) -C rust-releaser

update:
	touch lib.sh

.PHONY: all lint fix update
