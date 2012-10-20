include ../../Library/GNU.mk

Title=		Cscope
Name=		cscope
Version=	15.8
Revision=	0
URL=		http://downloads.sourceforge.net/cscope
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define test_inner_hook
$(BinDir)/cscope -V
endef
