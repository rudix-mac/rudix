BuildRequires += $(LibDir)/libintl.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

ifdef WITH_STATIC_LIBS
LdFlags += -framework CoreFoundation -liconv
endif

Title=		GNU Wget
Name=		wget
Version=	1.13.4
Revision=	2
URL=		http://ftp.gnu.org/gnu/wget/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-ssl=openssl

define install_post_hook
mv $(InstallDir)/$(Prefix)/etc/wgetrc $(InstallDir)/$(Prefix)/etc/wgetrc.default
endef

