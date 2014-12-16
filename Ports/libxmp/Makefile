include ../../Library/GNU.mk

Title=		Libxmp
Name=		libxmp
Version=	4.2.7
Revision=	0
Site=		http://xmp.sourceforge.net
URL=		http://downloads.sourceforge.net/xmp
Source=		$(Name)-$(Version).tar.gz
License=	LGPL

LicenseFile=	$(SourceDir)/docs/COPYING.LIB

define test_inner_hook
grep $(Version) $(LibDir)/pkgconfig/libxmp.pc
endef
