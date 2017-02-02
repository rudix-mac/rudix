include ../../Library/GNU.mk

Title=		Fping
Name=		fping
Version=	3.10
Site=           http://fping.org
Source=		http://fping.org/dist/$(Name)-$(Version).tar.gz
License=        BSD?

GnuConfigureExtra += --sbindir=$(BinDir)
GnuConfigureExtra += --enable-ipv4 --enable-ipv6

define test_hook
$(BinDir)/fping -v | grep $(Version)
$(BinDir)/fping6 -v | grep $(Version)
endef
