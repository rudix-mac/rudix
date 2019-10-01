include ../../Library/GNU.mk

Description=	ID database utilities
Title=		GNU ID Utils
Name=		idutils
Version=	4.6
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/idutils//$(Name)-$(Version).tar.xz
License=	GPL

define test_hook
$(BinDir)/mkid --version | grep $(Version)
endef
