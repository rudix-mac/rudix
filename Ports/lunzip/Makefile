include ../../Library/GNU.mk

Title=		Lunzip
Name=		lunzip
Version=	1.11
Site=           https://www.nongnu.org/lzip/
Source=		https://download.savannah.gnu.org/releases/lzip/lunzip/$(Name)-$(Version).tar.gz
License=        GPLv2

define test_hook
$(BinDir)/lunzip --version | grep $(Version)
endef
