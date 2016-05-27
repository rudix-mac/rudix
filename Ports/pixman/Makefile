include ../../Library/GNU.mk

Description=	Pixman is a low-level software library for pixel manipulation
Title=		Pixman
Name=		pixman
Version=	0.34.0
Revision=	0
Site=		http://pixman.org
Source=		http://www.cairographics.org/releases/$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
test -f $(LibDir)/libpixman-1.la
test -f $(LibDir)/pkgconfig/pixman-1.pc
endef
