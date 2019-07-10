BuildRequires += $(LibDir)/libintl.la # gettext

include ../../Library/GNU.mk

Title=		XZ Utils
Name=		xz
Version=	5.2.4
Site=		http://tukaani.org/xz/
Source=		http://tukaani.org/xz//$(Name)-$(Version).tar.bz2
License=	GPLv2+, LGPLv2.1+, Public Domain

define test_hook
$(BinDir)/xz --version | grep $(Version)
endef
