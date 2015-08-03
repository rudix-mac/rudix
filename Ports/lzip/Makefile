include ../../Library/GNU.mk

Title=		Lzip
Name=		lzip
Version=	1.17
Revision=	0
Site=           http://www.nongnu.org/lzip/
Source=		http://download.savannah.gnu.org/releases/lzip/$(Name)-$(Version).tar.gz
CheckSum=	08f828732393c8da962fd416116e1018cc5dd884
License=        GPL

define test_inner_hook
$(BinDir)/lzip --version | grep $(Version)
endef
