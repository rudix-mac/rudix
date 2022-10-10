include ../../Library/GNU.mk

Title=		pkgconf
Name=		pkgconf
Version=	1.9.3
Site=		https://pkgconf.org
Source=		https://distfiles.dereferenced.org/pkgconf/pkgconf-$(Version).tar.xz
License=	ISC
ReadMeFile=	$(SourceDir)/README.md

define test_hook
$(BinDir)/pkgconf --version | grep $(Version)
endef
