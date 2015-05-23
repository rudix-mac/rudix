# Copyright (c) 2005-2015 Ruda Moura (Rudix)

Rules  = retrieve prep build check install test pkg about
Rules += installclean clean distclean realdistclean pkgclean

Ports := $(wildcard [a-z]*)

all: about

# Almost an array of objects
json:
	@echo "["
	@for port in $(Ports); do \
		$(MAKE) -C $$port json ; \
		echo "," ; \
	done
	@echo "]"

$(Rules):
	@for port in $(Ports) ; do \
		$(MAKE) -C $$port $@ ; \
	done
