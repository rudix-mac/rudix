include ../../Library/GNU.mk

Title=		Texinfo
Name=		texinfo
Version=	5.1
Revision=	0
URL=		http://ftpmirror.gnu.org/texinfo/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define test_inner_hook
$(BinDir)/info --version
endef
