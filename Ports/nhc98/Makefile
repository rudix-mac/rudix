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
		--mandir=/usr/local/share/man/man1 \
		--docdir=/usr/local/share/doc/nhc98 ; make
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	perl -pi -e "s!$(BUILDDIR)/script/nhc98!/usr/local/bin/nhc98! ; s!$(BUILDDIR)/include!/usr/local/include/nhc98!" \
		$(INSTALLDIR)/usr/local/lib/hmake/ix86-Darwin-10.2.0/hmakerc
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYRIGHT,README} $(INSTALLDOCDIR)
	$(TOUCH) install

test: install
	$(TOUCH) test
