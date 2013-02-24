include ../../Library/GNU.mk

Title=		Yasm
Name=		yasm
Version=	1.2.0
Revision=	1
URL=		http://www.tortall.net/projects/yasm/releases/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	README

define install_post_hook
install -m 644 $(BuildDir)/{GNU*,*.txt} $(InstallDir)/$(DocDir)/yasm/
endef

define test_inner_hook
$(BinDir)/yasm --version | grep $(Version)
endef
