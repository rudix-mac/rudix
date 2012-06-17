BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libidn.la # static-libidn

include ../../Library/GNU.mk

Title=		mpop
Name=		mpop
Version=	1.0.27
Revision=	0
URL=		http://sourceforge.net/projects/mpop/files/mpop/$(Version)
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

EnvExtra += PKG_CONFIG_PATH=/usr/lib/pkgconfig
GnuConfigureExtra += --with-ssl=openssl

define install_post_hook
install -m 644 $(SourceDir)/doc/mpop* $(InstallDir)/$(DocDir)/$(Name)  
endef

define final_inner_hook
$(BinDir)/mpop --version
endef
