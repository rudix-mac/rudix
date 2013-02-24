BuildRequires += $(LibDir)/libintl.la # static-gettext
BuildRequires += $(LibDir)/libgc.la # static-gc

include ../../Library/GNU.mk

Title=		w3m
Name=		w3m
Version=	0.5.3
Revision=	0
URL=		http://sourceforge.net/projects/w3m/files/w3m/w3m-$(Version)
Source=		$(Name)-$(Version).tar.gz

LicenseFile=	LICENSE

GnuConfigureExtra += --enable-cplusplu

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -liconv -framework CoreFoundation
endif

define test_inner_hook
$(BinDir)/w3m -version | grep $(Version)
endef
