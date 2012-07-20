BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libglib-2.0.la # glib
BuildRequires += $(LibDir)/libintl.la # gettext

include ../../Library/GNU.mk

Title=		Irssi
Name=		irssi
Version=	0.8.15
Revision=	0
URL=		http://mirror.irssi.org/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-perl=no # disabled for now
