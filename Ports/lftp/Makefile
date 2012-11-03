BuildRequires += $(LibDir)/libintl.la # gettext
BuildRequires += $(LibDir)/libreadline.a # static-readline

include ../../Library/GNU.mk

Title=		LFTP
Name=		lftp
Version=	4.3.7
Revision=	0
URL=		http://ftp.yars.free.net/pub/source/lftp
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-openssl
GnuConfigureExtra += --with-modules

#ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
#LdFlags += -framework CoreFoundation -liconv
#endif

define install_post_hook
install -m 644 $(SourceDir)/{FAQ,FEATURES,TODO} $(InstallDir)/$(DocDir)/$(Name)
mv $(InstallDir)/$(Prefix)/etc/lftp.conf $(InstallDir)/$(Prefix)/etc/lftp.conf.default
endef

define test_inner_hook
$(BinDir)/lftp --version
endef
