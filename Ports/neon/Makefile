BuildRequires += $(BinDir)/pkg-config

include ../../Library/GNU.mk

Title=		Neon
Name=		neon
Version=	0.29.6
Revision=	0
URL=		http://www.webdav.org/neon/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	LICENSE

GnuConfigureExtra += --with-ssl=openssl

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
else
GnuConfigureExtra += --enable-static --enable-shared
endif

define test_inner_hook
$(BinDir)/neon-config --version
endef
