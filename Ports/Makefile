#
# Copyright (c) 2007-2011 Ruda Moura <ruda@rudix.org>
#

Rules  = retrieve prep build install pmdoc about
Rules += installpkg pkg dmg
Rules += installclean clean distclean realdistclean pkgclean dmgclean

Ports := $(wildcard [a-z]*)

all: about

$(Rules):
	@for port in $(Ports) ; do \
		$(MAKE) -C $$port $@ ; \
	done

new:
	mkdir $(port)
	sed 's*{NAME}*$(port)*' ../Documents/Makefile > $(port)/Makefile
	cd $(port)
	$(MAKE) -C $$port createpmdoc
