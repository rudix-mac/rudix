# GNU standards-compliant Makefile generator
# http://www.gnu.org/software/automake/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU Automake $(VERSION)
NAME=		automake
VERSION=	1.11.1
REVISION=	0
URL=		http://ftp.gnu.org/gnu/automake/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

# Autoconf 2.61a-341 or better is required.
DEPENDS+=	/usr/local/bin/autoconf

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env AUTOCONF=/usr/local/bin/autoconf \
	$(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	touch install

test: install
	cd $(BUILDDIR) ; make check
	touch test
