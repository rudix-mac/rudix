# Evented I/O for V8 JavaScript
# http://nodejs.org/
# BSD

include ../../Library/Rules.mk

TITLE=		Node.JS $(VERSION)
NAME=		node
VERSION=	0.3.6
REVISION=	0.i386
URL=		http://nodejs.org/dist/
SOURCE=		$(NAME)-v$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/LICENSE

prep: retrieve
	tar zxf $(SOURCE)
	mv node-v$(VERSION) node-$(VERSION)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ;./configure ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,ChangeLog,TODO} $(INSTALLDOCDIR)
	cp -av $(BUILDDIR)/doc/* $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	cd $(BUILDDIR) ; make test
	touch test
