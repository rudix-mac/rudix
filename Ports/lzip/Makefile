include ../../Library/GNU.mk

Title=		Lzip
Name=		lzip
Version=	1.17
Site=           http://www.nongnu.org/lzip/
Source=		http://download.savannah.gnu.org/releases/lzip/$(Name)-$(Version).tar.gz
License=        GPL

define test_hook
$(BinDir)/lzip --version | grep $(Version)
endef
