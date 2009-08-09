# Automatically configure source code on many Un*x platforms
# http://www.gnu.org/software/autoconf/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU Autoconf $(VERSION)
NAME=		autoconf
VERSION=	2.64
REVISION=	0
URL=		$(GNU)/gnu/autoconf/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" $(configure) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
