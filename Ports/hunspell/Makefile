BuildRequires += $(BinDir)/autoconf	# autoconf
BuildRequires += $(BinDir)/automake	# automake
BuildRequires += $(BinDir)/libtool	# libtool
BuildRequires += $(BinDir)/autopoint	# gettext | gettext
BuildRequires += $(LibDir)/libintl.la	# gettext | gettext
BuildRequires += $(LibDir)/pkgconfig/readline.pc	# readline

include ../../Library/GNU.mk

Title=		Hunspell
Name=		hunspell
Version=	1.7.0
Site=           https://hunspell.github.io
Source=		https://github.com/hunspell/hunspell/archive/v$(Version).tar.gz
License=        MPL

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/license.hunspell

GnuConfigureExtra += --with-readline
GnuConfigureExtra += --with-ui

define before_build_hook
cd $(BuildDir) && autoreconf -vfi
endef

define test_hook
$(BinDir)/hunspell --version | grep $(Version)
endef
