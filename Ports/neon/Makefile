BuildRequires += $(BinDir)/pkg-config

include ../../Library/GNU.mk

Title=		Neon
Name=		neon
Version=	0.30.1
Site=		http://www.webdav.org/neon/
Source=		http://www.webdav.org/neon//$(Name)-$(Version).tar.gz
License=	LGPL

LicenseFile=	LICENSE

GnuConfigureExtra += --with-ssl=openssl

define test_hook
$(BinDir)/neon-config --version | grep $(Version)
endef
