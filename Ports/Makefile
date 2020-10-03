# Copyright (c) 2005-2020 Rudá Moura (Rudix)

Rules  = retrieve prep build check install test pkg about static
Rules += installclean clean distclean realclean pkgclean

Ports := $(wildcard [a-z]*)

all: about

$(Rules):
	@for port in $(Ports) ; do \
		$(MAKE) -C $$port $@ ; \
	done
