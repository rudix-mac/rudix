include ../../Library/GNU.mk

Title=		GNU Inetutils
Name=		inetutils
Version=	1.9.4
Site=		http://www.gnu.org/software/inetutils/
Source=		http://ftp.gnu.org/gnu/inetutils/$(Name)-$(Version).tar.xz
License=	GPLv3

define test_hook
$(BinDir)/inetutils --version | grep $(Version)
nm $(BinDir)/inetutils | grep -q intl
nm $(BinDir)/inetutils | grep -q idn
nm $(BinDir)/inetutils | grep -q ssl
endef
