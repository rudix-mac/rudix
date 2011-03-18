# $Id: Makefile,v 1.3 2009/07/24 00:55:36 ruda Exp $
#
# Copyright (c) 2007-2009 Ruda Moura <ruda@rudix.org>
#

Rules  = retrieve prep build install pmdoc about
Rules += installpkg pkg dmg
Rules += installclean clean distclean realdistclean pkgclean dmgclean

Ports := $(wildcard [a-z]*)

all: dmg

$(Rules):
	@for port in $(Ports) ; do \
		$(MAKE) -C $$port $@ ; \
	done

only-static-libs:
	@for port in gettext readline gmp glib ; do \
		$(MAKE) -C $$port STATIC_ONLY=1 pkg ; \
	done

new:
	mkdir $(port)
	cp ../Documents/Makefile $(port)

