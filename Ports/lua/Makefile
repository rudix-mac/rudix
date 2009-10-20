# Powerful, light-weight programming language
# http://www.lua.org/

include ../../Library/Rules.mk

TITLE=		Lua $(VERSION)
NAME=		lua
VERSION=	5.1.4
REVISION=	2
URL=		http://www.lua.org/ftp/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR)/etc ; patch < $(PORTDIR)/lua.pc.patch
	$(TOUCH) prep

build: prep
	cd $(BUILDDIR) ; \
	$(make)	CFLAGS="$(CFLAGS) -DLUA_USE_MACOSX -DLUA_USE_READLINE" \
		MYLDFLAGS="$(LDFLAGS)" macosx
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; \
	make INSTALL_TOP=$(INSTALLDIR)/usr/local INSTALL_MAN=$(INSTALLDIR)/usr/local/share/man/man1 install
	install -d $(INSTALLDIR)/usr/local/lib/pkgconfig
	install -m 644 $(BUILDDIR)/etc/lua.pc $(INSTALLDIR)/usr/local/lib/pkgconfig
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYRIGHT,HISTORY,README} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/* $(INSTALLDOCDIR)
	rm -f $(INSTALLDOCDIR)/*.1
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(STRIP_LIB) $(INSTALLDIR)/usr/local/lib/*.a
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make test
	$(TOUCH) test
