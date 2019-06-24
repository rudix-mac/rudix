include ../../Library/GNU.mk

Title=		GNU PIC Utilities
Name=		gputils
Version=	1.5.0
Site=		http://gputils.sourceforge.net
Source=		http://downloads.sourceforge.net/gputils/$(Name)-$(Version)-1.tar.gz
License=	GPL

UncompressedName=$(Name)-$(Version)

GnuConfigureExtra += --disable-html-doc

define test_hook
$(BinDir)/gpasm --version 2>&1 | grep $(Version)
endef
