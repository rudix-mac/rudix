include ../../Library/GNU.mk

Title=		FLTK Library
Name=		fltk
Version=	1.3.3
Site=		http://www.fltk.org
Source=		http://fltk.org/pub/fltk/$(Version)/$(Name)-$(Version)-source.tar.gz
License=	LGPL

define test_hook
$(BinDir)/fltk-config --version | grep $(Version)
endef
