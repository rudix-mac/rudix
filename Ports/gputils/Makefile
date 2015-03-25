include ../../Library/GNU.mk

Title=		GNU PIC Utilities
Name=		gputils
Version=	1.4.0
Revision=	0
Site=		http://gputils.sourceforge.net
URL=		http://downloads.sourceforge.net/gputils
Source=		$(Name)-$(Version)-1.tar.gz
License=	GPL

UncompressedName=$(Name)-$(Version)-1

GnuConfigureExtra += --disable-html-doc

define test_inner_hook
$(BinDir)/gpasm --version 2>&1 | grep $(Version)
endef
