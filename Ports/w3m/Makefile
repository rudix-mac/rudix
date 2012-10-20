BuildRequires += $(LibDir)/libgc.la # static-gc
BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		w3m
Name=		w3m
Version=	0.5.3
Revision=	0
URL=		http://sourceforge.net/projects/w3m/files/w3m/w3m-$(Version)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/doc/README
LicenseFile=	LICENSE

GnuConfigureExtra += --enable-cplusplu

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -liconv -framework CoreFoundation
endif

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif

define test_inner_hook
$(BinDir)/w3m -version
endef
