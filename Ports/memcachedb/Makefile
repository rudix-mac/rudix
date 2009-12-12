# Distributed key-value storage system
# http://memcachedb.org/

include ../../Library/Rules.mk

NAME=		memcachedb
VERSION=	1.2.0
REVISION=	0
URL=		http://memcachedb.googlecode.com/files/
SOURCE=		$(NAME)-$(VERSION).tar.gz

DEPENDS=	/usr/local/lib/libevent.la
DEPENDS+=	/usr/local/lib/libdb.a

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,CREDITS,ChangeLog,LICENSE,README,TODO,doc/*.txt} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/tools/*.py $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
