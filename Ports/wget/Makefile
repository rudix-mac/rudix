# Retrieve files from the web via HTTP, HTTPS and FTP
# http://www.gnu.org/software/wget/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU Wget $(VERSION)
NAME=		wget
VERSION=	1.12
REVISION=	0
URL=		http://ftp.gnu.org/gnu/wget/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
NLS=		--enable-nls
DEPENDS+=	/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

prep: retrieve
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
		$(configure) --disable-dependency-tracking $(NLS) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	mv $(INSTALLDIR)/usr/local/etc/wgetrc \
		$(INSTALLDIR)/usr/local/etc/wgetrc.default
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS} $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
