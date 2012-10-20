include ../../Library/GNU.mk

Title=		pkg-config
Name=		compat-pkg-config
Version=	0.25
Revision=	0
URL=		http://pkgconfig.freedesktop.org/releases/
Source=		pkg-config-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = pkg-config-$(Version)

define test_inner_hook
$(BinDir)/pkg-config --version
endef
