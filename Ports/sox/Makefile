include ../../Library/GNU.mk

Title=		SoX
Name=		sox
Version=	14.4.0
Revision=	0
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define test_inner_hook
$(BinDir)/sox --version
endef
