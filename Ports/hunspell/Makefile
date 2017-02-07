#BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Hunspell
Name=		hunspell
Version=	1.6.0
Site=           http://hunspell.sourceforge.net
Source=		https://github.com/hunspell/hunspell/archive/v$(Version).tar.gz
License=        GPL

GnuConfigureExtra += --with-included-gettext
#GnuConfigureExtra += --with-readline
GnuConfigureExtra += --with-ui

define test_hook
$(BinDir)/hunspell --version | grep $(Version)
endef
