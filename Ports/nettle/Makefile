include ../../Library/GNU.mk

Title=		Nettle (low-level crypto library)
Name=		nettle
Version=	2.7.1
Revision=	0
URL=		http://www.lysator.liu.se/~nisse/archive/
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	$(SourceDir)/COPYING.LIB

# Examples, tests and tools requires static libs
GnuConfigureExtra += --enable-static
