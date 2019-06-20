include ../../Library/GNU.mk

Title=		Tinc
Name=		tinc
Version=	1.0.35
Site=		https://tinc-vpn.org/
Source=		${Site}/packages/${Name}-${Version}.tar.gz
License=        GPL

define test_hook
$(BinDir)/tinc --version | grep $(Version)
endef
