# Portable Haskell compiler
# http://www.haskell.org/nhc98/
# BSD

include ../../Library/Rules.mk

TITLE=		nhc98 $(VERSION)
NAME=		nhc98
VERSION=	1.22
REVISION=	1
URL=		http://www.haskell.org/nhc98/
SOURCE=		$(NAME)src-$(VERSION).tar.gz

README=		$(BUILDDIR)/docs/index.html
LICENSE=	$(BUILDDIR)/COPYRIGHT

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; ./configure \
		--mandir=/usr/local/share/man/man1 \
		--docdir=/usr/local/share/doc/nhc98 ; make
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	perl -pi -e "s!$(BUILDDIR)/script/cabal-parse!/usr/local/lib/nhc98/ix86-Darwin10/cabal-parse!" \
		$(INSTALLDIR)/usr/local/bin/cabal-parse
	perl -pi -e "s!$(BUILDDIR)/script/harch!/usr/local/bin/harch!" \
		$(INSTALLDIR)/usr/local/bin/nhc98-pkg
	perl -pi -e "s!$(BUILDDIR)/script/nhc98!/usr/local/bin/nhc98! ; s!$(BUILDDIR)/include!/usr/local/include/nhc98!" \
		$(INSTALLDIR)/usr/local/lib/hmake/ix86-Darwin10/hmakerc
	perl -pi -e "s!$(BUILDDIR)/script/cabal-parse!/usr/local/lib/nhc98/ix86-Darwin10/cabal-parse!" \
		$(INSTALLDIR)/usr/local/lib/nhc98/ix86-Darwin10/config
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYRIGHT,README} $(INSTALLDOCDIR)
	touch install

test: install
	cd $(BUILDDIR) ; make test
	touch test
