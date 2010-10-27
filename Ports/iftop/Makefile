# Display bandwidth usage on an interface
# http://www.ex-parrot.com/pdw/iftop/
# GPL

include ../../Library/Rules.mk

TITLE=		iftop $(VERSION)
NAME=		iftop
VERSION=	0.17
REVISION=	0
URL=		http://www.ex-parrot.com/pdw/iftop/download
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(configure) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,INSTALL,NEWS,README,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/sbin/iftop
	touch install

test: install
	lipo $(INSTALLDIR)/usr/local/sbin/iftop -verify_arch i386 x86_64 
	touch test
