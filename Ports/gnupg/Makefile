include ../../Library/GNU.mk

Title=		GnuPG
Name=		gnupg
Version=	1.4.13
Revision=	0
URL=		ftp://ftp.gnupg.org/gcrypt/gnupg/
Source=		$(Name)-$(Version).tar.bz2

define test_inner_hook
$(BinDir)/gpg --version | grep $(Version)
endef
