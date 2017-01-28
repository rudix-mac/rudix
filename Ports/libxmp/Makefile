include ../../Library/GNU.mk

Title=		Libxmp
Name=		libxmp
Version=	4.2.7
Site=		http://xmp.sourceforge.net
Source=		http://downloads.sourceforge.net/xmp/$(Name)-$(Version).tar.gz
License=	LGPL

LicenseFile=	$(SourceDir)/docs/COPYING.LIB

define test_inner_hook
grep $(Version) $(LibDir)/pkgconfig/libxmp.pc
endef
