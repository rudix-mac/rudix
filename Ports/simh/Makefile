# PDP, IBM 1401, Nova and other CPUs simulator
# http://simh.trailing-edge.com/
#

include ../../Library/Rules.mk

TITLE=		SIMH $(VERSION)
NAME=		simh
VERSION=	3.8.1
REVISION=	0
URL=		http://simh.trailing-edge.com/sources/
SOURCE=		$(NAME)v38-1.zip

prep: retrieve
	unzip -o -a -d $(BUILDDIR) $(SOURCE)
	patch -d $(BUILDDIR) < simh-3.8.1-pcap.patch
	mkdir $(BUILDDIR)/BIN
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
		OSTYPE="darwin" USE_NETWORK=1 $(make)
	touch build

install: build
	install -d $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/BIN/* $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/*.txt $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
