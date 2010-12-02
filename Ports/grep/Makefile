# GNU versions of grep pattern matching utilities
# http://www.gnu.org/software/grep/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU Grep $(VERSION)
NAME=		grep
VERSION=	2.7
REVISION=	0
URL=		http://ftp.gnu.org/gnu/grep/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
DEPENDS+=	/usr/local/lib/libintl.la
NLS=		--enable-nls
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

prep: retrieve
	tar jxvf $(SOURCE)
	#cd $(BUILDDIR)/po ; patch < $(PORTDIR)/Makefile.in.in.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
		--disable-dependency-tracking \
		--program-prefix=gnu ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	./links.sh $(INSTALLDIR)/usr/local/bin
	./links.sh $(INSTALLDIR)/usr/local/share/man/man1
	cd $(INSTALLDIR)/usr/local/share/info ; ln -sf grep.info gnugrep.info
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	#strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	touch install
