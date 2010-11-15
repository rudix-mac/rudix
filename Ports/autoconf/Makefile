# Automatically configure source code on many Un*x platforms
# http://www.gnu.org/software/autoconf/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU Autoconf $(VERSION)
NAME=		autoconf
VERSION=	2.68
REVISION=	0
URL=		http://ftp.gnu.org/gnu/autoconf/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

prep: retrieve
	tar jxf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,ChangeLog,NEWS,THANKS,TODO} $(INSTALLDOCDIR)
	touch install

test: install
	cd $(BUILDDIR) ; make check
	touch test
