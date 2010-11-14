# Ftp replacement with advanced user interface
# http://www.ncftp.com/
# The Clarified Artistic License

include ../../Library/Rules.mk

TITLE=		NcFTP Client $(VERSION)
NAME=		ncftp
VERSION=	3.2.4
REVISION=	0
SOURCE=		$(NAME)-$(VERSION)-src.tar.bz2
URL=		ftp://ftp.ncftp.com/ncftp

prep: retrieve
	tar jxvf $(SOURCE)
	touch prep

build: prep
	cd $(BUILDDIR) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) --disable-universal --disable-precomp ; $(make)
	touch build

install: build
	install -d $(INSTALLDIR)/usr/local/share/man/man1
	cd $(BUILDDIR) ; make DESTDIR=$(INSTALLDIR) install
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{DONATE.txt,README.txt} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/{CHANGELOG.txt,what_changed_between_v2_v3.txt,FIREWALLS_AND_PROXIES.txt} $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/doc/html/* $(INSTALLDOCDIR)
	$(STRIP_BIN) $(INSTALLDIR)/usr/local/bin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
