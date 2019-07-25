include ../../Library/GNU.mk

Title=		libgpg-error
Name=		libgpg-error
Version=	1.36
Site=		https://gnupg.org
Source=		https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-$(Version).tar.bz2
License=        LGPLv2.1+

define test_hook
$(BinDir)/libgpg-error --version | grep $(Version)
endef
