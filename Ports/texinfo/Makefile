include ../../Library/GNU.mk

Title=		Texinfo
Name=		texinfo
Version=	5.1
Revision=	0
Site=		http://savannah.gnu.org/projects/texinfo
Source=		http://ftpmirror.gnu.org/texinfo//$(Name)-$(Version).tar.gz
License=	GPL

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define test_inner_hook
$(BinDir)/info --version
endef
