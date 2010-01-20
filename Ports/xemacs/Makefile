# Heavily customizable and extensible editor
# http://www.xemacs.org/
# GPL

include ../../Library/Rules.mk

NAME=		xemacs
VERSION=	21.4.22
REVISION=	1.i386
URL=		http://ftp.xemacs.org/pub/xemacs/stable/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

CFLAGS=		-arch i386 -Os
LDFLAGS=	-arch i386

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
NLS=		--enable-nls
DEPENDS+=	/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

ifdef WITHOUT_DB
DB=		--with-database=no
else
DB=		--with-database=db
#DEPENDS+=	/usr/local/lib/libdb.la
endif

ifdef WITHOUT_X11
X11=		--without-x11
else
X11=		--with-x11
DEPENDS+=	/usr/X11R6
endif

prep: retrieve
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --with-mule $(DB) $(X11) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make \
		prefix=$(INSTALLDIR)/usr/local \
		mandir=$(INSTALLDIR)/usr/local/share/man/man1 \
		infodir=$(INSTALLDIR)/usr/local/share/info install
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	rm -f $(INSTALLDIR)/usr/local/bin/?tags
	rm -f $(INSTALLDIR)/usr/local/share/man/man1/?tags.1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{BUGS,COPYING,ChangeLog,PROBLEMS,README*} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	cd $(BUILDDIR) ; make check
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test
