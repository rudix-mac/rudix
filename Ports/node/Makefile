# Evented I/O for V8 JavaScript
# http://nodejs.org/
# BSD

include ../../Library/Rules.mk

TITLE=		Node.js $(VERSION)
NAME=		node
VERSION=	0.4.0
REVISION=	0
URL=		http://nodejs.org/dist/
SOURCE=		$(NAME)-v$(VERSION).tar.gz

README=		$(BUILDDIR)/README.md
LICENSE=	$(BUILDDIR)/LICENSE

prep: retrieve
	tar zxf $(SOURCE)
	mv node-v$(VERSION) node-$(VERSION)
	touch prep

build: prep $(DEPENDS)
	for a in ia32 x64 ; do \
		cd $(BUILDDIR) ; make clean ; \
		./configure --dest-cpu=$$a ; $(make) ; \
		mv build build-$$a ; \
	done
	lipo -create \
		-arch i386 $(BUILDDIR)/build-ia32/default/node \
		-arch x86_64 $(BUILDDIR)/build-x64/default/node \
		-output $(BUILDDIR)/build-ia32/default/node
	cd $(BUILDDIR) ; ln -sf build-ia32 build
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
	lipo $(INSTALLDIR)/usr/local/bin/node -verify_arch i386 x86_64
	#cd $(BUILDDIR) ; make test
	touch test
