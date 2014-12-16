BuildRequires += $(BinDir)/pkg-config

include ../../Library/GNU.mk

Title=		Neon
Name=		neon
Version=	0.30.1
Revision=	0
Site=		http://www.webdav.org/neon/
URL=		http://www.webdav.org/neon/
Source=		$(Name)-$(Version).tar.gz
License=	LGPL

LicenseFile=	LICENSE

GnuConfigureExtra += --with-ssl=openssl

define test_inner_hook
$(BinDir)/neon-config --version | grep $(Version)
endef
