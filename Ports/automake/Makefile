# Autoconf 2.61a-341 or better is required.
BuildRequires += $(BinDir)/autoconf

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		GNU Automake
Name=		automake
Version=	1.11.3
Revision=	0
URL=		http://ftp.gnu.org/gnu/automake/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

EnvExtra += AUTOCONF=/usr/local/bin/autoconf
