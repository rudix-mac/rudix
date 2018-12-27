BuildRequires += $(BinDir)/aclocal	# automake
BuildRequires += $(BinDir)/autoconf	# autoconf

include ../../Library/GNU.mk

Title=		Yasm
Name=		yasm
Version=	1.3.0
Site=		http://yasm.tortall.net/
Source=		https://github.com/yasm/yasm/archive/v$(Version).tar.gz
#Source=		http://www.tortall.net/projects/yasm/releases//$(Name)-$(Version).tar.gz
License=	BSD

ReadMeFile=	README


define build_pre_hook
cd $(BuildDir); ./autogen.sh
endef

define install_post_hook
install -m 644 $(BuildDir)/GNU* $(InstallDir)/$(DocDir)/yasm/
install -m 644 $(BuildDir)/*.txt $(InstallDir)/$(DocDir)/yasm/
endef

define test_hook
$(BinDir)/yasm --version | grep $(Version)
endef
