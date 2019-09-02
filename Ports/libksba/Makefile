include ../../Library/GNU.mk

Title=		Libksba
Name=		libksba
Version=	1.3.5
Site=		https://www.gnupg.org/
Source=		https://www.gnupg.org/ftp/gcrypt/libksba/libksba-$(Version).tar.bz2
License=        GPL

define test_hook
$(BinDir)/libksba --version | grep $(Version)
endef
