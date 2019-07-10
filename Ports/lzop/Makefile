BuildRequires += $(LibDir)/liblzo2.la # lzo

include ../../Library/GNU.mk

Title=		Lzop
Name=		lzop
Version=	1.03
Site=		http://www.lzop.org
Source=		http://www.lzop.org/download/$(Name)-$(Version).tar.gz
License=	GPL

define test_hook
$(BinDir)/lzop --version | grep $(Version)
endef
