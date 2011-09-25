include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/UnixFormula.mk

Name=		imap
Version=	2007f
Revision=	0
URL=		ftp://ftp.cac.washington.edu/mail/
Source=		$(Name)-$(Version).tar.gz

MakeExtra += EXTRACFLAGS="$(CFlags)" oxp

ifdef FOO
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

endif
