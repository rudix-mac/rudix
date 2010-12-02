# GNU Stream Editor
# http://www.gnu.org/software/sed/
# GPL

include ../../Library/Rules.mk

TITLE=		GNU Sed $(VERSION)
NAME=		sed
VERSION=	4.2.1
REVISION=	1
URL=		http://ftp.gnu.org/gnu/sed/
SOURCE=		$(NAME)-$(VERSION).tar.gz

README=		$(BUILDDIR)/README
LICENSE=	$(BUILDDIR)/COPYING

ifdef WITHOUT_NLS
CONFIG_OPTS=	--disable-nls
else
CONFIG_OPTS=	--enable-nls
DEPENDS+=	/usr/local/lib/libintl.la
endif

ifdef WITH_STATIC_NLS
LDFLAGS+=	-framework CoreFoundation -liconv
endif

prep: retrieve
	tar zxvf $(SOURCE)
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIG_OPTS) \
		--disable-dependency-tracking \
		--program-prefix=gnu ; $(make)
	touch build

install: build
	cd $(BUILDDIR) ; \
	make prefix=$(INSTALLDIR)/usr/local \
		mandir=$(INSTALLDIR)/usr/local/share/man install
	cd $(INSTALLDIR)/usr/local/bin ; ln -sf gnused sed
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; ln -sf gnused.1 sed.1
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,BUGS,COPYING,NEWS,README,THANKS} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	cd $(BUILDDIR) ; make check
	touch test
