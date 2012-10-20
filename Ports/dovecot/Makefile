include ../../Library/GNU.mk

Title=		dovecot
Name=		dovecot
Version=	2.1.7
Revision=	0
URL=		http://dovecot.org/releases/2.1/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define test_inner_hook
sudo $(SBinDir)/dovecot -c tests/dovecot.conf
endef
