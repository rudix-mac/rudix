include ../../Library/Config.mk
# Don't build universal, don't even set arch
RUDIX_UNIVERSAL=
include ../../Library/Rudix.mk
# Don't set compile flags
CFlags=
CxxFlags=
LdFlags=
include ../../Library/GNUFormula.mk

Title=		GMP
Name=		gmp
Version=	5.0.4
Revision=	0
URL=		ftp://ftp.gmplib.org/pub/gmp-$(Version)/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --enable-fat=yes
GnuConfigureExtra += --enable-cxx
