BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libglib-2.0.la # static-glib
BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Irssi
Name=		irssi
Version=	0.8.15
Revision=	0
URL=		http://mirror.irssi.org/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-perl=no # disabled for now

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv	# static-get
LdFlags += -framework Carbon		# FSFindFolder
endif

define install_post_hook
mv $(InstallDir)/$(SysConfDir)/irssi.conf \
	$(InstallDir)/$(SysConfDir)/irssi.conf.default
endef

define test_inner_hook
$(BinDir)/irssi --version
endef
