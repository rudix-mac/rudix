include ../../Library/GNU.mk

Title=		Lunzip
Name=		lunzip
Version=	1.7
Revision=	0
Site=           http://www.nongnu.org/lzip/
Source=		http://download.savannah.gnu.org/releases/lzip/lunzip/$(Name)-$(Version).tar.lz
License=        GPL

define test_inner_hook
$(BinDir)/lunzip --version | grep $(Version)
endef
