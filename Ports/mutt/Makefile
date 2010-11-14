# Tty-based e-mail client
# http://www.mutt.org/
# GPL

include ../../Library/Rules.mk

NAME=		mutt
VERSION=	1.5.20
REVISION=	0
URL=		ftp://ftp.mutt.org/mutt/devel/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
NLS=		--enable-nls
DEPENDS=	/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch -b < $(PORTDIR)/Makefile.in.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" \
	$(configure) \
		--disable-dependency-tracking \
		--with-docdir=/usr/local/share/doc/mutt  \
		--enable-pop --enable-imap --with-ssl $(NLS) ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	mv $(INSTALLDIR)/usr/local/etc/Muttrc $(INSTALLDIR)/usr/local/etc/Muttrc.default
	mv $(INSTALLDIR)/usr/local/etc/mime.types $(INSTALLDIR)/usr/local/etc/mime.types.default
	rm -rf $(INSTALLDIR)/usr/local/lib
	rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{NEWS,README*,TODO,VERSION} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	lipo $(INSTALLDIR)/usr/local/bin/mutt -verify_arch i386 x86_64
	lipo $(INSTALLDIR)/usr/local/bin/mutt_dotlock -verify_arch i386 x86_64
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/pgp*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test

# WARNING: Put this on mutt.pmdoc
# chown root:mail	/usr/local/bin/mutt_dotlock
# chmod g+s 		/usr/local/bin/mutt_dotlock

