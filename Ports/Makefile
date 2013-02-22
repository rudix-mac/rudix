# Copyright (c) 2005-2013 Rudix

Rules  = retrieve prep build check install test pkg about
Rules += installclean clean distclean realdistclean pkgclean

Ports := $(wildcard [a-z]*)

all: about

$(Rules):
	@for port in $(Ports) ; do \
		$(MAKE) -C $$port $@ ; \
	done
