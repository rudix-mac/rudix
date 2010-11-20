# Analyze C source files and print a call graph
# http://www.gnu.org/software/cflow/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU cflow $(VERSION)
NAME=		cflow
VERSION=	1.3
REVISION=	1
URL=		http://ftp.gnu.org/gnu/cflow/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

ifdef WITHOUT_NLS
CONFIG_OPTS=	--disable-nls
else
CONFIG_OPTS=	--enable-nls
DEPENDS=	/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

prep: retrieve
	tar jxvf $(SOURCE)
	patch -d $(BUILDDIR)/lib < $(PORTDIR)/argp-pv.c.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-dependency-tracking $(NLS) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(README) $(INSTALLDOCDIR)
	install -m 644 $(LICENSE) $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,ChangeLog,NEWS,THANKS,TODO} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
