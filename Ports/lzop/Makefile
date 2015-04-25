BuildRequires += $(LibDir)/liblzo2.la # static-lzo

include ../../Library/GNU.mk

Title=		Lzop
Name=		lzop
Version=	1.03
Revision=	0
Site=		http://www.lzop.org
Source=		http://www.lzop.org/download/$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/lzop --version | grep $(Version)
endef
