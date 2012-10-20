BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libidn.la # static-libidn

include ../../Library/GNU.mk

Title=		GNU Wget
Name=		wget
Version=	1.14
Revision=	0
URL=		http://ftp.gnu.org/gnu/wget/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-ssl=openssl
GnuConfigureExtra += --with-libidn

define install_post_hook
mv $(InstallDir)/$(Prefix)/etc/wgetrc $(InstallDir)/$(Prefix)/etc/wgetrc.default
endef

define test_inner_hook
$(BinDir)/wget --version
endef

# Due static-gettext
ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif
