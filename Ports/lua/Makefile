# Powerful, light-weight programming language
# http://www.lua.org/
# MIT

include ../../Library/Rules.mk

TITLE=		Lua $(VERSION)
NAME=		lua
VERSION=	5.2.0
REVISION=	0
URL=		http://www.lua.org/work/
SOURCE=		$(NAME)-$(VERSION)-alpha.tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(PORTDIR)/COPYRIGHT

prep: retrieve
	tar zxf $(SOURCE)
	mv lua-$(VERSION)-alpha $(NAME)-$(VERSION)
	touch prep

build: prep
	cd $(BUILDDIR) ; \
	$(make)	CFLAGS="$(CFLAGS) -DLUA_USE_READLINE" \
		MYLDFLAGS="$(LDFLAGS)" macosx
	touch build

install: build
	cd $(BUILDDIR) ; \
	make INSTALL_TOP=$(INSTALLDIR)/usr/local INSTALL_MAN=$(INSTALLDIR)/usr/local/share/man/man1 install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(PORTDIR)/COPYRIGHT $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/README $(INSTALLDOCDIR)
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
