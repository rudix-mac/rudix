BuildRequires += $(LibDir)/libintl.la # gettext

include ../../Library/GNU.mk

Title=		aria2
Name=		aria2
Version=	1.31.0
Site=		https://aria2.github.io/
Source=		https://github.com/aria2/aria2/releases/download/release-$(Version)/$(Name)-$(Version).tar.bz2
License=	GPL

ReadMeFile=	$(SourceDir)/README.rst

define test_hook
$(BinDir)/aria2c --version | grep $(Version)
nm $(BinDir)/aria2c | grep libintl
endef
