include ../../Library/GNU.mk

Title=		Lzip
Name=		lzip
Version=	1.15
Revision=	0
Site=           http://www.nongnu.org/lzip/
URL=		http://download.savannah.gnu.org/releases/lzip/
Source=		$(Name)-$(Version).tar.gz
License=        GPL

define test_inner_hook
$(BinDir)/lzip --version | grep $(Version)
endef
