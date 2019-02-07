include ../../Library/GNU.mk

Title=		ISL
Name=		isl
Version=	0.20
Site=		http://isl.gforge.inria.fr
Source=		http://isl.gforge.inria.fr/isl-$(Version).tar.xz
License=        MIT
LicenseFile=	$(SourceDir)/LICENSE

define test_hook
test -f $(LibDir)/libisl.la
test -f $(LibDir)/pkgconfig/isl.pc
endef
