#BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Hunspell
Name=		hunspell
Version=	1.3.3
Site=           http://hunspell.sourceforge.net
Source=		http://downloads.sourceforge.net/hunspell/$(Name)-$(Version).tar.gz
License=        GPL

GnuConfigureExtra += --with-included-gettext
#GnuConfigureExtra += --with-readline
GnuConfigureExtra += --with-ui

define test_hook
$(BinDir)/hunspell --version | grep $(Version)
endef
