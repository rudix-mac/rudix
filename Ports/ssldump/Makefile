# SSLv3/TLS network protocol analyzer
# http://www.rtfm.com/ssldump/
# BSD

include ../../Library/Rules.mk

TITLE=		ssldump $(VERSION)
NAME=		ssldump
VERSION=	0.9b3
REVISION=	1
URL=		http://www.rtfm.com/ssldump/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	cd $(BUILDDIR) ; patch < $(PORTDIR)/configure.patch
	cd $(BUILDDIR)/base ; patch < $(PORTDIR)/pcap-snoop.c.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; $(configure) --host=i386-freebsd ; $(make)
	touch build

install: build
# pass -B option to make due an INSTALL file in the same directory
# Mac OS X with HLS+ is case insensitive. -B force rules
	cd $(BUILDDIR) ; \
	make -B prefix=$(INSTALLDIR)/usr/local \
		MANDIR=$(INSTALLDIR)/usr/local/share/man install

	#rm -f $(INSTALLDIR)/usr/local/share/info/dir
	#rm -f $(INSTALLDIR)/usr/local/lib/charset.alias
	#rm -f $(INSTALLDIR)/usr/local/share/locale/locale.alias

	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{COPYRIGHT,CREDITS,ChangeLog,README} $(INSTALLDOCDIR)

	$(STRIP_BIN) $(INSTALLDIR)/usr/local/sbin/*
	touch install

test: install
	for x in $(wildcard $(INSTALLDIR)/usr/local/bin/*) ; do \
		lipo $$x -verify_arch i386 x86_64 ; done
	touch test
