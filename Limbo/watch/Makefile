# GNU watch command
# http://procps.sourceforge.net/
# GPL

NAME=		watch
VERSION=	3.2.7
REVISION=	12
URL=		http://procps.sourceforge.net/
SOURCE=		procps-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	mv procps-$(VERSION) $(NAME)-$(VERSION)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/nowarncommon.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(make) CFLAGS="$(CFLAGS)" watch
	touch build

install: build
	install -d $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/watch $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDIR)/usr/local/share/man/man1
	install -m 644 $(BUILDDIR)/watch.1 $(INSTALLDIR)/usr/local/share/man/man1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,NEWS} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	touch test
