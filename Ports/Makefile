#
# Copyright (c) 2007-2011 Ruda Moura <ruda@rudix.org>
#

Rules  = retrieve prep build install test pkg
Rules += installclean clean distclean realdistclean pkgclean

Ports := $(wildcard [a-z]*)

all: clean

$(Rules):
	@for port in $(Ports) ; do \
		$(MAKE) -C $$port $@ ; \
	done
