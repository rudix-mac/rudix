include ../../Library/GNU.mk

Title=		Pixman
Name=		pixman
Version=	0.32.6
Revision=	0
Site=		http://cgit.freedesktop.org/pixman/
URL=		http://www.cairographics.org/releases/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
test -f $(LibDir)/libpixman-1.la
test -f $(LibDir)/pkgconfig/pixman-1.pc
endef
