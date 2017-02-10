BuildRequires += $(BinDir)/pkg-config # pkg-config
BuildRequires += $(LibDir)/libglib-2.0.la # static-glib
BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Irssi
Name=		irssi
Version=	1.0.1
Site=		http://irssi.org/
Source=		https://github.com/irssi/irssi/releases/download/$(Version)/$(Name)-$(Version).tar.gz
License=	GPL
ReadMeFile=	$(SourceDir)/README.md

GnuConfigureExtra += --with-perl=no # disabled for now

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv   # static-get
LdFlags += -framework Carbon           # FSFindFolder
endif

define install_post_hook
mv $(InstallDir)/$(SysConfDir)/irssi.conf \
	$(InstallDir)/$(SysConfDir)/irssi.conf.default
endef

define test_hook
$(BinDir)/irssi --version | grep $(Version)
endef
