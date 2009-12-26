# GNU Make
# http://www.gnu.org/software/make/
# GPLv3

include ../../Library/Rules.mk

TITLE=		GNU Make $(VERSION)
NAME=		make
VERSION=	3.81
REVISION=	3
URL=		http://ftp.gnu.org/gnu/make/
SOURCE=		$(NAME)-$(VERSION).tar.bz2

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
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) $(CONFIG_OPTS) \
		--disable-dependency-tracking \
		--program-prefix="gnu" ; $(make)
	$(TOUCH) build

install: build
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	cd $(INSTALLDIR)/usr/local/bin ; ln -sf gnumake make
	cd $(INSTALLDIR)/usr/local/share/man/man1 ; ln -sf gnumake.1 make.1
	rm -f $(INSTALLDIR)/usr/local/share/info/dir
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{AUTHORS,COPYING,ChangeLog,NEWS,README} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	$(TOUCH) install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	cd $(BUILDDIR) ; make check
	$(TOUCH) test
