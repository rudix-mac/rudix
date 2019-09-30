include ../../Library/GNU.mk

Title=		GNU Diffutils
Name=		diffutils
Version=	3.7
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/$(Name)/$(Name)-$(Version).tar.xz
License=        GPLv3

define test_hook
$(BinDir)/diff --version | grep $(Version)
endef
