BuildRequires += $(LibDir)/libjpeg.la # libjpeg

include ../../Library/GNU.mk

Title=		JPEG to ASCII
Name=		jp2a
Version=	1.0.6
Site=		https://csl.name/jp2a/
Source=		http://downloads.sourceforge.net/jp2a/$(Name)-$(Version).tar.bz2
License=        GPL

define check_hook
cd $(BuildDir) && \
$(MAKE) test || $(call error_color,One or more tests failed)
endef

define test_hook
$(BinDir)/jp2a --version 2>&1 | grep $(Version)
endef
