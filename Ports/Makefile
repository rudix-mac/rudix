# Copyright (c) 2005-2012 Ruda Moura

Rules  = retrieve prep build install test pkg
Rules += installclean clean distclean realdistclean pkgclean

Ports := $(wildcard [a-z]*)

all: clean

$(Rules):
	@for port in $(Ports) ; do \
		$(MAKE) -C $$port $@ ; \
	done
