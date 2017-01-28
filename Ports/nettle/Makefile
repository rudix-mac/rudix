include ../../Library/GNU.mk

Title=		Nettle (low-level crypto library)
Name=		nettle
Version=	3.0
Site=		http://www.lysator.liu.se/~nisse/nettle/
Source=		http://www.lysator.liu.se/~nisse/archive//$(Name)-$(Version).tar.gz
License=	LGPL/GPL

LicenseFile=	$(SourceDir)/COPYING.LESSERv3

# Examples, tests and tools requires static libs
GnuConfigureExtra += --enable-static
