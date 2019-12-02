include ../../Library/Unix.mk

Title=		bzip2
Name=		bzip2
Version=	1.0.8
Site=		https://sourceware.org/$(Name)
Source=		https://sourceware.org/pub/$(Name)/$(Name)-$(Version).tar.gz
License=        BSD

PatchLevel = -p1
LicenseFile = $(BuildDir)/LICENSE
define build_hook
	env $(MakeExtras) make -C $(BuildDir)
endef

define test_hook
$(BinDir)/bzip2 --version | grep $(Version)
endef
