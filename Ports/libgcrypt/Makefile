include ../../Library/GNU.mk

Title=		libgcrypt
Name=		libgcrypt
Version=	1.8.4
Site=		https://gnupg.org
Source=		https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-$(Version).tar.bz2
License=        LGPLv2.1+

define test_hook
$(BinDir)/libgcrypt --version | grep $(Version)
endef
