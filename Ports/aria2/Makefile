BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		aria2
Name=		aria2
Version=	1.18.3
Revision=	0
Site=		http://aria2.sourceforge.net/
URL=		http://downloads.sourceforge.net/aria2
Source=		$(Name)-$(Version).tar.bz2
License=	GPL

ReadMeFile=	$(SourceDir)/README.rst

GnuConfigureExtra += --with-included-gettext

define test_inner_hook
$(BinDir)/aria2c --version | grep $(Version)
endef
