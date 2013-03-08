# Which came first, the chicken or the egg?
# Install compat-pkg-config (pkg-config 0.25)
BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libglib-2.0.la

include ../../Library/GNU.mk

Title=		pkg-config
Name=		pkg-config
AltName=	pkg
Version=	0.27
Revision=	0
URL=		http://pkgconfig.freedesktop.org/releases/
Source=		$(Name)-$(Version).tar.gz

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation # static-gettext
LdFlags += -framework Carbon # static-glib
endif

define test_inner_hook
$(BinDir)/pkg-config --version
endef
