include ../../Library/GNU.mk

Title=		Texinfo
Name=		texinfo
Version=	6.1
Site=		http://savannah.gnu.org/projects/texinfo
Source=		https://ftp.gnu.org/gnu/texinfo/texinfo-$(Version).tar.xz
License=	GPLv3+

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define test_inner_hook
$(BinDir)/info --version | grep $(Version)
$(BinDir)/texi2pdf --version | grep $(Version)
endef
