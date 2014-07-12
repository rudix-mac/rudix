BuildRequires += $(LibDir)/libjpeg.la # static-libjpeg
BuildRequires += $(LibDir)/libtiff.la # static-libtiff

include ../../Library/GNU.mk

Title=		Little CMS
Name=		lcms
Version=	2.6
Revision=	0
Site=		http://www.littlecms.com/
URL=		http://downloads.sourceforge.net/lcms
Source=		$(Name)2-$(Version).tar.gz
Checksum=	b0ecee5cb8391338e6c281d1c11dcae2bc22a5d2
License=	MIT

ReadMeFile=	$(SourceDir)/README.1ST

UncompressedName=lcms2-$(Version)

define test_inner_hook
$(BinDir)/jpgicc
$(BinDir)/tificc
endef
