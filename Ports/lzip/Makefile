include ../../Library/GNU.mk

Title=		Lzip
Name=		lzip
Version=	1.23
Site=           https://www.nongnu.org/lzip/
Source=		https://download.savannah.gnu.org/releases/lzip/$(Name)-$(Version).tar.gz
License=        GPLv2

define test_hook
$(BinDir)/lzip --version | grep $(Version)
endef
