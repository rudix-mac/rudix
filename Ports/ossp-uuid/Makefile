include ../../Library/GNU.mk

Title=		OSSP-UUID
Name=		ossp-uuid
Version=	1.6.2
Site=		https://web.archive.org/web/www.ossp.org/pkg/lib/uuid/
Source=		https://mirrors.ocf.berkeley.edu/debian/pool/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz
License=        GPL

GnuConfigureExtra += --without-perl
GnuConfigureExtra += --without-php
GnuConfigureExtra += --without-pgsql

UncompressedName=uuid-$(Version)
LicenseFile=$(BuildDir)/README
