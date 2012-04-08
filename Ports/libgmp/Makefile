include ../../Library/Config.mk
# Don't build universal, don't even set arch
RUDIX_UNIVERSAL=
include ../../Library/Rudix.mk
# Don't set compile flags
CFlags=
CxxFlags=
LdFlags=
include ../../Library/GNUFormula.mk

Title=		GNU MP
Name=		libgmp
Version=	5.0.4
Revision=	0
URL=		ftp://ftp.gmplib.org/pub/gmp-$(Version)/
Source=		gmp-$(Version).tar.bz2

UncompressedName = gmp-$(Version)

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --enable-fat
GnuConfigureExtra += --disable-cxx
GnuConfigureExtra += --disable-static

define install_post_hook
rm -rf $(InstallDir)/$(IncludeDir)
rm -rf $(InstallDir)/$(InfoDir)
rm -f $(InstallDir)/$(LibDir)/libgmp.la
endef

