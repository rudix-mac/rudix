BuildRequires += $(BinDir)/pkg-config

include ../../Library/GNU.mk

Title=		mpop
Name=		mpop
Version=	1.0.26
Revision=	0
URL=		http://downloads.sourceforge.net/mpop/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
define prep_post_hook
perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif

EnvExtra += PKG_CONFIG_PATH=/usr/lib/pkgconfig
GnuConfigureExtra += --with-ssl=openssl

define install_post_hook
install -m 644 $(SourceDir)/doc/mpop* $(InstallDir)/$(DocDir)/$(Name)  
endef
