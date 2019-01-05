include ../../Library/GNU.mk

Title=		Fping
Name=		fping
Version=	4.1
Site=           http://fping.org
Source=		http://fping.org/dist/$(Name)-$(Version).tar.gz
License=        BSD?

ReadMeFile =	$(BuildDir)/CHANGELOG.md

GnuConfigureExtra += --sbindir=$(BinDir)
GnuConfigureExtra += --enable-ipv4 --enable-ipv6

define test_hook
$(BinDir)/fping -v | grep $(Version)
$(BinDir)/fping6 -v | grep $(Version)
endef
