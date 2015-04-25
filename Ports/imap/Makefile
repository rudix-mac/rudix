include ../../Library/Unix.mk

Title=		IMAP UW
Name=		imap
Version=	2007f
Revision=	1
Site=		http://www.washington.edu/imap/
Source=		ftp://ftp.cac.washington.edu/mail//$(Name)-$(Version).tar.gz
License=	Apache License 2.0

LicenseFile=	$(SourceDir)/LICENSE.txt

define build_inner_hook
cd $(BuildDir) ; make EXTRACFLAGS="$(CFlags)" EXTRALDFLAGS="$(LdFlags)" oxp
endef

define test_inner_hook
endef

define install_inner_hook
install -d $(InstallDir)/usr/local/sbin
install -m 755 $(BuildDir)/imapd/imapd $(InstallDir)/usr/local/sbin
install -m 755 $(BuildDir)/ipopd/ipop2d $(InstallDir)/usr/local/sbin
install -m 755 $(BuildDir)/ipopd/ipop3d $(InstallDir)/usr/local/sbin
install -m 755 $(BuildDir)/mlock/mlock $(InstallDir)/usr/local/sbin
install -m 755 $(BuildDir)/ipopd/ipop2d $(InstallDir)/usr/local/sbin
install -d $(InstallDir)/usr/local/bin
install -m 755 $(BuildDir)/dmail/dmail $(InstallDir)/usr/local/bin
install -m 755 $(BuildDir)/mailutil/mailutil $(InstallDir)/usr/local/bin
install -m 755 $(BuildDir)/tmail/tmail $(InstallDir)/usr/local/bin
install -d $(InstallDir)/usr/local/share/man/man8/
install -m 644 $(BuildDir)/src/imapd/imapd.8 $(InstallDir)/usr/local/share/man/man8/imapd.8
install -m 644 $(BuildDir)/src/ipopd/ipopd.8 $(InstallDir)/usr/local/share/man/man8/ipopd.8
install -d $(InstallDir)/usr/local/share/man/man1
install -m 644 $(BuildDir)/src/dmail/dmail.1 $(InstallDir)/usr/local/share/man/man1
install -m 644 $(BuildDir)/src/mailutil/mailutil.1 $(InstallDir)/usr/local/share/man/man1
install -m 644 $(BuildDir)/src/tmail/tmail.1 $(InstallDir)/usr/local/share/man/man1
install -d $(InstallDir)/usr/local/include/c-client
install -m 644 $(BuildDir)/c-client/*.h $(InstallDir)/usr/local/include/c-client
install -d $(InstallDir)/usr/local/lib
install -m 644 $(BuildDir)/c-client/c-client.a $(InstallDir)/usr/local/lib/libc-client.a
$(install_base_documentation)
endef
