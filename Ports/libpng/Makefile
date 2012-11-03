include ../../Library/GNU.mk

Title=		PNG
Name=		libpng
Version=	1.5.10
Revision=	0
URL=		http://sourceforge.net/projects/libpng/files/libpng15/$(Version)
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif

define test_inner_hook
$(BinDir)/libpng-config --version
endef
