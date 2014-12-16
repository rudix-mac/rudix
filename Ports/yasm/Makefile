include ../../Library/GNU.mk

Title=		Yasm
Name=		yasm
Version=	1.3.0
Revision=	0
Site=		http://yasm.tortall.net/
URL=		http://www.tortall.net/projects/yasm/releases/
Source=		$(Name)-$(Version).tar.gz
License=	BSD

ReadMeFile=	README

define install_post_hook
install -m 644 $(BuildDir)/{GNU*,*.txt} $(InstallDir)/$(DocDir)/yasm/
endef

define test_inner_hook
$(BinDir)/yasm --version | grep $(Version)
endef
