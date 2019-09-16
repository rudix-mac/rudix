include ../../Library/GNU.mk

Title=		Texinfo
Name=		texinfo
Version=	6.6
Site=		http://savannah.gnu.org/projects/texinfo
Source=		http://ftpmirror.gnu.org/$(Name)/$(Name)-$(Version).tar.xz
License=	GPLv3+

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define test_hook
$(BinDir)/info --version | grep $(Version)
$(BinDir)/texi2pdf --version | grep $(Version)
endef
