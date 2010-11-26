# GNU Make
# http://www.gnu.org/software/make/
# GPLv3

include ../../Library/Rules.mk

TITLE=		GNU Make $(VERSION)
NAME=		make
VERSION=	3.82
REVISION=	1
URL=		http://ftp.gnu.org/gnu/make/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

ifdef WITHOUT_NLS
NLS=	--disable-nls
else
NLS=	--enable-nls
DEPENDS+=	/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

prep: retrieve
	tar jxf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(NLS) \
		--disable-dependency-tracking \
		--program-prefix="gnu" ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	cd $(INSTALLDIR)/usr/local/bin ; ln -sf gnumake make
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; ln -sf gnumake.1 make.1
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	touch test
