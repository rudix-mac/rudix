# $Id: Makefile,v 1.2 2009/03/05 22:22:38 ruda Exp $

# Gnuplot is a command-driven interactive function plotting program
# http://www.gnuplot.info/
# GPL

NAME=		gnuplot
VERSION=	4.2.4
REVISION=	1
URL=		$(SOURCEFORGE)gnuplot
SOURCE=		$(NAME)-$(VERSION).tar.gz

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--with-readline=builtin ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{BUGS,ChangeLog,Copyright,FAQ,NEWS,README,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip $(INSTALLDIR)/usr/local/libexec/gnuplot/4.2/gnuplot_x11
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/libexec/gnuplot/4.2/gnuplot_x11"
	$(TOUCH) test
