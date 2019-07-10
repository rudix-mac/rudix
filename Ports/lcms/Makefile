BuildRequires += $(LibDir)/libjpeg.la # libjpeg
BuildRequires += $(LibDir)/libtiff.la # libtiff

include ../../Library/GNU.mk

Title=		Little CMS
Name=		lcms
Version=	2.6
Site=		http://www.littlecms.com/
Source=		http://downloads.sourceforge.net/lcms/$(Name)2-$(Version).tar.gz
License=	MIT

ReadMeFile=	$(SourceDir)/README.1ST

UncompressedName=lcms2-$(Version)

define test_hook
$(BinDir)/jpgicc
$(BinDir)/tificc
endef
