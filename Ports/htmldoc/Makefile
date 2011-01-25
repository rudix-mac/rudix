# Convert HTML pages to PDF/PS format
# http://www.htmldoc.org/

include ../../Library/Rules.mk

NAME=		htmldoc
VERSION=	1.8.27
REVISION=	12
URL=		http://ftp.easysw.com/pub/htmldoc/$(VERSION)/
SOURCE=		$(NAME)-$(VERSION)-source.tar.bz2

README=		$(BUILDDIR)/README.txt
LICENSE=	$(BUILDDIR)/COPYING.txt

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" CXXFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
		--prefix=/usr/local \
		--bindir=/usr/local/bin ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make \
		prefix=$(INSTALLDIR)/usr/local \
		bindir=$(INSTALLDIR)/usr/local/bin \
		mandir=$(INSTALLDIR)/usr/local/share/man install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{CHANGES.txt,COPYING.txt,README.txt,htmldoc.eula} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
