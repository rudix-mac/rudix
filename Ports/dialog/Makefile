BuildRequires += $(LibDir)/libintl.la # gettext

include ../../Library/GNU.mk

Title=		Dialog
Name=		dialog
Version=	1.2
AltVersion=	20140911
Site=		http://invisible-island.net/dialog/dialog.html
Source=		ftp://invisible-island.net/dialog//$(Name)-$(Version)-$(AltVersion).tgz
License=	LGPL

UncompressedName=$(Name)-$(Version)-$(AltVersion)

define after_install_hook
install -m 644 $(SourceDir)/samples/*.rc $(InstallDir)/$(DocDir)/$(Name)
endef

define test_hook
$(BinDir)/dialog --version
endef
