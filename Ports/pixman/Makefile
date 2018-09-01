include ../../Library/GNU.mk

Title=		Pixman
Name=		pixman
Version=	0.34.0
Site=		http://pixman.org
Source=		http://www.cairographics.org/releases/$(Name)-$(Version).tar.gz
License=	MIT

define test_hook
test -f $(LibDir)/libpixman-1.la
test -f $(LibDir)/pkgconfig/pixman-1.pc
endef
