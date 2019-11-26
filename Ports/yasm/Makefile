include ../../Library/GNU.mk

Title=		Yasm
Name=		yasm
Version=	1.3.0
Site=		http://yasm.tortall.net/
Source=		http://www.tortall.net/projects/yasm/releases/yasm-$(Version).tar.gz
License=	BSD
ReadMeFile=	README
LicenseFile=	$(BuildDir)/COPYING

define test_hook
$(BinDir)/yasm --version | grep $(Version)
endef
