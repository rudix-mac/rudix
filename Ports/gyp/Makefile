include ../../Library/GNU.mk

Title=		GYP
Name=		gyp
Version=	1.0
Site=		https://gyp.gsrc.io
Source=		https://rudix.org/download/$(Name)-$(Version).tar.gz
License=        GPL

define test_hook
$(BinDir)/gyp --version | grep $(Version)
endef
