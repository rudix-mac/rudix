include ../../Library/GNU.mk

Title=		GnuPG
Name=		gnupg
Version=	1.4.18
Revision=	0
Site=		http://gnupg.org/
URL=		ftp://ftp.gnupg.org/gcrypt/gnupg/
Source=		$(Name)-$(Version).tar.bz2
License=	GPL

define test_inner_hook
$(BinDir)/gpg --version | grep $(Version)
endef
