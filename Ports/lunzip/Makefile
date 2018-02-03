include ../../Library/GNU.mk

Title=		Lunzip
Name=		lunzip
Version=	1.9
Site=           http://www.nongnu.org/lzip/
Source=		http://download.savannah.gnu.org/releases/lzip/lunzip/$(Name)-$(Version).tar.gz
License=        GPL

define test_hook
$(BinDir)/lunzip --version | grep $(Version)
endef
