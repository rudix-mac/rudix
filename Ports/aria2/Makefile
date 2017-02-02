BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		aria2
Name=		aria2
Version=	1.18.8
Site=		http://aria2.sourceforge.net/
Source=		http://downloads.sourceforge.net/aria2/$(Name)-$(Version).tar.bz2
License=	GPL

ReadMeFile=	$(SourceDir)/README.rst

define test_hook
$(BinDir)/aria2c --version | grep $(Version)
nm $(BinDir)/aria2c | grep libintl
endef
