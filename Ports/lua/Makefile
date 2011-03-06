# Powerful, light-weight programming language
# http://www.lua.org/
# MIT

include ../../Library/Rules.mk

TITLE=		Lua $(VERSION)
NAME=		lua
VERSION=	5.1.4
REVISION=	5
URL=		http://www.lua.org/ftp/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYRIGHT

prep: retrieve
	tar zxvf $(SOURCE)
	patch -d $(BUILDDIR)/etc < $(PORTDIR)/lua.pc.patch
	patch -d $(BUILDDIR)/src < $(PORTDIR)/patch-lua-5.1.4-2.patch
	touch prep

build: prep
	cd $(BUILDDIR) ; \
	$(make)	CFLAGS="$(CFLAGS) -DLUA_USE_MACOSX -DLUA_USE_READLINE" \
		MYLDFLAGS="$(LDFLAGS)" macosx
	touch build

install: build
	cd $(BUILDDIR) ; \
	make INSTALL_TOP=$(INSTALLDIR)/usr/local INSTALL_MAN=$(INSTALLDIR)/usr/local/share/man/man1 install
	install -d $(INSTALLDIR)/usr/local/lib/pkgconfig
	install -m 644 $(BUILDDIR)/etc/lua.pc $(INSTALLDIR)/usr/local/lib/pkgconfig
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYRIGHT,HISTORY,INSTALL,README} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/* $(INSTALLDOCDIR)
	rm -f $(INSTALLDOCDIR)/*.1
	strip $(INSTALLDIR)/usr/local/bin/*
	strip -x $(INSTALLDIR)/usr/local/lib/*.a
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/lib/*.a) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	otool -L $(INSTALLDIR)/usr/local/bin/lua | grep libedit
	cd $(BUILDDIR) ; make test
	touch test
