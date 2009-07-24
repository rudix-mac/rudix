# $Id: Makefile,v 1.2 2009/03/21 20:25:03 ruda Exp $

# Tty-based e-mail client
# http://www.mutt.org/

NAME=		mutt
VERSION=	1.5.19
REVISION=	0
URL=		ftp://ftp.mutt.org/mutt/devel/
SOURCE=		$(NAME)-$(VERSION).tar.gz

ifdef WITHOUT_NLS
NLS=		--disable-nls
else
NLS=		--enable-nls
DEPENDS=	/usr/local/lib/libintl.dylib
endif

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch -b < $(PORTDIR)/Makefile.in.patch
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; \
	env CFLAGS="$(CFLAGS)" $(configure) \
		--disable-dependency-tracking \
		--with-docdir=/usr/local/share/doc/mutt  \
		--enable-pop --enable-imap \
		--with-ssl $(NLS) ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	mv $(INSTALLDIR)/usr/local/etc/Muttrc $(INSTALLDIR)/usr/local/etc/Muttrc.default
	mv $(INSTALLDIR)/usr/local/etc/mime.types $(INSTALLDIR)/usr/local/etc/mime.types.default
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{NEWS,README*,TODO,VERSION} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(TOUCH) test

#permgroup: contents
#	chown -R root:wheel $(CONTENTS)
#	chown root:admin $(CONTENTS)/
#	chmod g+wt $(CONTENTS)/
#	chown root:mail $(CONTENTS)/usr/local/bin/mutt_dotlock
#	chmod g+s $(CONTENTS)/usr/local/bin/mutt_dotlock
#	$(TOUCH) permgroup
