include ../../Library/GNU.mk

Title=		GnuPG
Name=		gnupg
Version=	2.2.17
Site=		http://gnupg.org/
Source=		https://gnupg.org/ftp/gcrypt/gnupg/gnupg-$(Version).tar.bz2
License=	GPLv3

define test_hook
$(BinDir)/gpg --version | grep $(Version)
endef
