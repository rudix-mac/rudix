# University of Washington IMAP4rev1/POP2/POP3 mail servers
# http://www.washington.edu/imap/
# Apache License 2.0

include ../../Library/Rules.mk

NAME=		imap
VERSION=	2007e
REVISION=	2
URL=		ftp://ftp.cac.washington.edu/mail/
SOURCE=		$(NAME)-$(VERSION).tar.gz

prep: retrieve
	tar zxvf $(SOURCE)
	patch -d $(BUILDDIR) -p1 < $(PORTDIR)/pam.patch
	touch prep

build: prep $(DEPENDS)
	cd $(BUILDDIR) ; make EXTRACFLAGS="$(CFLAGS)" oxp
	touch build

install: build
	install -d $(INSTALLDIR)/usr/local/sbin
	install -m 755 $(BUILDDIR)/imapd/imapd $(INSTALLDIR)/usr/local/sbin
	install -m 755 $(BUILDDIR)/ipopd/ipop2d $(INSTALLDIR)/usr/local/sbin
	install -m 755 $(BUILDDIR)/ipopd/ipop3d $(INSTALLDIR)/usr/local/sbin
	install -m 755 $(BUILDDIR)/mlock/mlock $(INSTALLDIR)/usr/local/sbin
	install -m 755 $(BUILDDIR)/ipopd/ipop2d $(INSTALLDIR)/usr/local/sbin
	install -d $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/dmail/dmail $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/mailutil/mailutil $(INSTALLDIR)/usr/local/bin
	install -m 755 $(BUILDDIR)/tmail/tmail $(INSTALLDIR)/usr/local/bin
	install -d $(INSTALLDIR)/usr/local/share/man/man8/
	install -m 644 $(BUILDDIR)/src/imapd/imapd.8 $(INSTALLDIR)/usr/local/share/man/man8/imapd.8
	install -m 644 $(BUILDDIR)/src/ipopd/ipopd.8 $(INSTALLDIR)/usr/local/share/man/man8/ipopd.8
	install -d $(INSTALLDIR)/usr/local/share/man/man1
	install -m 644 $(BUILDDIR)/src/dmail/dmail.1 $(INSTALLDIR)/usr/local/share/man/man1
	install -m 644 $(BUILDDIR)/src/mailutil/mailutil.1 $(INSTALLDIR)/usr/local/share/man/man1
	install -m 644 $(BUILDDIR)/src/tmail/tmail.1 $(INSTALLDIR)/usr/local/share/man/man1
	install -d $(INSTALLDIR)/usr/local/include/c-client
	install -m 644 $(BUILDDIR)/c-client/*.h $(INSTALLDIR)/usr/local/include/c-client
	install -d $(INSTALLDIR)/usr/local/lib
	install -m 644 $(BUILDDIR)/c-client/c-client.a $(INSTALLDIR)/usr/local/lib/libc-client.a
	install -d $(INSTALLDOCDIR)
	install -m 644 $(BUILDDIR)/{LICENSE.txt,NOTICE,README,SUPPORT} $(INSTALLDOCDIR)
	strip $(INSTALLDIR)/usr/local/bin/*
	strip $(INSTALLDIR)/usr/local/sbin/*
	strip -x -S $(INSTALLDIR)/usr/local/lib/lib*.a
	touch install

test: install
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/bin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/sbin/*"
	$(test-universal-binary) "$(INSTALLDIR)/usr/local/lib/lib*.a"
	touch test
