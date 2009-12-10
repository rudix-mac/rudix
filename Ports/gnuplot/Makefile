# Gnuplot is a command-driven interactive function plotting program
# http://www.gnuplot.info/
# GPL

include ../../Library/Rules.mk

NAME=		gnuplot
VERSION=	4.2.6
REVISION=	1
URL=		http://downloads.sourceforge.net/gnuplot
SOURCE=		$(NAME)-$(VERSION).tar.gz

DEPENDS=	/usr/local/bin/gdlib-config

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
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
