#BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Hunspell
Name=		hunspell
Version=	1.3.3
Revision=	1
Site=           http://hunspell.sourceforge.net
URL=		http://downloads.sourceforge.net/hunspell
Source=		$(Name)-$(Version).tar.gz
License=        GPL

GnuConfigureExtra += --with-included-gettext
#GnuConfigureExtra += --with-readline
GnuConfigureExtra += --with-ui

define test_inner_hook
$(BinDir)/hunspell --version | grep $(Version)
endef
