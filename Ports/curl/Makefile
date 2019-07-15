include ../../Library/GNU.mk

Title=		Curl
Name=		curl
Version=	7.65.1
Site=		https://curl.haxx.se
Source=		https://curl.haxx.se/download/curl-7.65.1.tar.bz2
License=        GPL

define test_hook
$(BinDir)/curl --version | grep $(Version)
endef
