BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Dialog
Name=		dialog
Version=	1.2
AltVersion=	20121230
Revision=	0
URL=		ftp://invisible-island.net/dialog/
Source=		$(Name)-$(Version)-$(AltVersion).tgz

UncompressedName=$(Name)-$(Version)-$(AltVersion)

define install_post_hook
install -m 644 $(SourceDir)/samples/*.rc $(InstallDir)/$(DocDir)/$(Name)
endef

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
endif

define test_inner_hook
$(BinDir)/dialog --version
endef
