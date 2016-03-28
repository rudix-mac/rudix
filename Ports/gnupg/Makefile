include ../../Library/GNU.mk

Title=		GnuPG
Name=		gnupg
Version=	1.4.20
Revision=	0
Site=		http://gnupg.org/
Source=		ftp://ftp.gnupg.org/gcrypt/gnupg/$(Name)-$(Version).tar.bz2
Checksum=	cbc9d960e3d8488c32675019a79fbfbf8680387e
License=	GPLv3

define test_inner_hook
$(BinDir)/gpg --version | grep $(Version)
endef
