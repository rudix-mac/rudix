include ../../Library/GNU.mk

Title=		GnuPG
Name=		gnupg
Version=	1.4.19
Revision=	0
Site=		http://gnupg.org/
Source=		ftp://ftp.gnupg.org/gcrypt/gnupg/$(Name)-$(Version).tar.bz2
Checksum=	5503f7faa0a0e84450838706a67621546241ca50
License=	GPL

define test_inner_hook
$(BinDir)/gpg --version | grep $(Version)
endef
