# GIT - Tree History Storage Tool
# http://git.or.cz/
# GPL

include ../../Library/Rules.mk

NAME=		git
VERSION=	1.6.5
REVISION=	0
URL=		http://www.kernel.org/pub/software/scm/git/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/Makefile.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	make configure ; env CFLAGS="$(CFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install #install-doc
	rm -rf $(INSTALLDIR)/usr/local/Library
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYING,README} $(INSTALLDOCDIR)
	find $(INSTALLDIR)/usr/local/bin -type f -exec strip {} \;
	$(TOUCH) install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/git -verify_arch i386 x86_64
	#cd $(BUILDDIR) ; make check
	$(TOUCH) test
