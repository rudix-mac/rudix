include ../../Library/GNU.mk

Title=		Libassuan
Name=		libassuan
Version=	2.5.3
Site=		https://rudix.org/
Source=		https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.3.tar.bz2
License=        GPL

define test_hook
$(BinDir)/libassuan --version | grep $(Version)
endef
