# Finds and then operates on files
# http://www.gnu.org/software/findutils/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU Find Utilities $(VERSION)
NAME=		findutils
VERSION=	4.4.2
REVISION=	0
URL=		http://ftp.gnu.org/gnu/findutils/
SOURCE=		$(NAME)-$(VERSION).tar.gz

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
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) \
		--disable-dependency-tracking \
		--program-prefix=gnu \
		--with-included-regex ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	./links.sh $(INSTALLDIR)/usr/local/bin
	./links.sh $(INSTALLDIR)/usr/local/share/man/man1
	./links.sh $(INSTALLDIR)/usr/local/share/man/man5
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	cd $(INSTALLDIR)/usr/local/share/info ; ln -sf find.info gnufind.info
	rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README,THANKS,TODO} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/libexec/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	for x in $(wildcard $(INSTALLDIR)/usr/local/libexec/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	touch test
