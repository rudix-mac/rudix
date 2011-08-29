include ../../Library/Config.mk

# Don't build universal, don't even set arch
RUDIX_UNIVERSAL=

include ../../Library/Rudix.mk

# Don't set compile flags
CFlags=
CxxFlags=
LdFlags=

include ../../Library/GNUFormula.mk

Description=	GNU MP is a free library for arbitrary precision arithmetic
Site=		http://gmplib.org/
License=	GPL
Title=		GMP (libgmp)
Name=		libgmp
Version=	5.0.2
Revision=	0
URL=		ftp://ftp.gmplib.org/pub/gmp-$(Version)/
Source=		gmp-$(Version).tar.bz2

UncompressedName=gmp-$(Version)

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

pmdoc:
	$(create_pmdoc)
