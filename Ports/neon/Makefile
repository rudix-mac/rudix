BuildRequires += $(BinDir)/pkg-config

include ../../Library/GNU.mk

Title=		Neon
Name=		neon
Version=	0.29.6
Revision=	1
URL=		http://www.webdav.org/neon/
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	LICENSE

GnuConfigureExtra += --with-ssl=openssl

define test_inner_hook
$(BinDir)/neon-config --version
endef
