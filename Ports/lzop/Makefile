include ../../Library/GNU.mk

BuildRequires += $(LibDir)/liblzo2.la # lzo

Title=		Lzop
Name=		lzop
Version=	1.04
Site=		https://www.lzop.org
Source=		https://www.lzop.org/download/$(Name)-$(Version).tar.gz
License=	GPLv2

define test_hook
$(BinDir)/lzop --version | grep $(Version)
endef
