# Portable Haskell compiler
# http://www.haskell.org/nhc98/
# BSD

include ../../Library/Rules.mk

TITLE=		nhc98 $(VERSION)
NAME=		nhc98
VERSION=	1.20
REVISION=	0
URL=		ftp://ftp.cs.york.ac.uk/pub/haskell/nhc98/
SOURCE=		$(NAME)src-$(VERSION).tar.gz

prep: retrieve
	tar jxvf $(SOURCE)
	patch -d $(BUILDDIR) -p0 < $(PORTDIR)/patch-Makefile.nhc98.diff
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; ./configure \
		--mandir=/usr/local/share/man \
		--docdir=/usr/local/share/doc/nhc98 ; make
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYRIGHT,README} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	#$(STRIP_BIN) $(INSTALLDIR)/usr/local/sbin/*
	#$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.dylib
	#$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/lib*.a
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
