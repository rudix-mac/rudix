include ../../Library/GNU.mk

Title=		Curl
Name=		curl
Version=	7.65.3
Site=		https://curl.haxx.se
Source=		$(Site)/download/$(Name)-$(Version).tar.bz2
License=        GPL

define test_hook
$(BinDir)/curl --version | grep $(Version)
endef
