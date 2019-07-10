BuildRequires += $(BinDir)/msgfmt	# gettext
BuildRequires += $(LibDir)/libintl.la	# gettext

include ../../Library/Unix.mk

Title=		Dos2Unix
Name=		dos2unix
Version=	7.3.4
Site=		http://waterlan.home.xs4all.nl/dos2unix.html
Source=		http://waterlan.home.xs4all.nl/dos2unix//$(Name)-$(Version).tar.gz
License=	BSD

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/COPYING.txt

MakeInstallExtra += prefix=$(Prefix) docsubdir=dos2unix

define test_hook
$(BinDir)/dos2unix -V
$(BinDir)/unix2dos -V
endef
