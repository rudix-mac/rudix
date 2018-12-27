BuildRequires += $(LibDir)/libpng.la # static-libpng > 1.5.10
include ../../Library/GNU.mk

Title=		Freetype
Name=		freetype
Version=	2.9.1
Site=		http://www.freetype.org/
Source=		http://download.savannah.gnu.org/releases/freetype//$(Name)-$(Version).tar.gz
License=	FTP/GPL Version 2
LicenseFile=	$(SourceDir)/docs/LICENSE.txt

GnuConfigureExtra += --enable-freetype-config
GnuConfigureExtra += --without-harfbuzz
