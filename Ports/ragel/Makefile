include ../../Library/GNU.mk

Title=		Ragel
Name=		ragel
Version=	6.7
Revision=	0
URL=		http://www.complang.org/ragel/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define test_inner_hook
cd $(BuildDir)/test ; ./runtests
endef

define test_inner_hook
$(BinDir)/ragel --version
endef
