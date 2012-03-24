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
Name=		gmp4
Version=	4.3.2
Revision=	1
URL=		ftp://ftp.gmplib.org/pub/gmp-$(Version)/
Source=		gmp-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = gmp-$(Version)

#GnuConfigureExtra += --enable-fat=yes
GnuConfigureExtra += --enable-cxx
