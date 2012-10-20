# Which came first, the chicken or the egg?
# Install compat-pkg-config (pkg-config 0.25)
BuildRequires += $(BinDir)/pkg-config
BuildRequires += $(LibDir)/libglib-2.0.la

include ../../Library/GNU.mk

Title=		pkg-config
Name=		pkg-config
AltName=	pkg
Version=	0.26
Revision=	1
URL=		http://pkgconfig.freedesktop.org/releases/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define test_inner_hook
$(BinDir)/pkg-config --version
endef
