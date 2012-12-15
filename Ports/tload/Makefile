include ../../Library/Unix.mk

Title=		Tload
Name=		tload
Version=	3.2.8
Revision=	0
URL=		https://github.com/ruda/tload/archive/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

UncompressedName=$(Name)--$(Name)-$(Version)

define test_build
endef

define test_inner_hook
$(BinDir)/tload -V
endef