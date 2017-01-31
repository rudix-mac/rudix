include ../../Library/GNU.mk

Title=		GnuPG
Name=		gnupg
Version=	1.4.21
Site=		http://gnupg.org/
Source=		https://gnupg.org/ftp/gcrypt/gnupg/gnupg-$(Version).tar.bz2
License=	GPLv3

define test_inner_hook
$(BinDir)/gpg --version | grep $(Version)
endef
