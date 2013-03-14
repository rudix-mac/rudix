include ../../Library/GNU.mk

Title=		GnuPG
Name=		gnupg
Version=	1.4.13
Revision=	0
URL=		ftp://ftp.gnupg.org/gcrypt/gnupg/
Source=		$(Name)-$(Version).tar.bz2

ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

define test_inner_hook
$(BinDir)/gpg --version | grep $(Version)
endef
