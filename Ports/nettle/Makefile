include ../../Library/GNU.mk

Title=		Nettle (low-level crypto library)
Name=		nettle
Version=	3.4
Site=		http://www.lysator.liu.se/~nisse/nettle/
Source=		https://ftp.gnu.org/gnu/nettle/$(Name)-$(Version).tar.gz
License=	LGPL/GPL

LicenseFile=	$(SourceDir)/COPYING.LESSERv3

# Examples, tests and tools requires static libs
GnuConfigureExtra += --enable-static
GnuConfigureExtra += --enable-fat
GnuConfigureExtra += --disable-public-key
GnuConfigureExtra += --disable-openssl
