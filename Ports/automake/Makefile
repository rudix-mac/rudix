# Autoconf 2.61a-341 or better is required.
BuildRequires += $(BinDir)/autoconf

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		GNU Automake
Name=		automake
Version=	1.11.1
Revision=	2
URL=		http://ftp.gnu.org/gnu/automake/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

EnvExtra += AUTOCONF=/usr/local/bin/autoconf
