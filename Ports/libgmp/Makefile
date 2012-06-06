include ../../Library/GNU.mk

Title=		GNU MP (Library)
Name=		libgmp
Version=	5.0.5
Revision=	0
URL=		http://ftp.gnu.org/gnu/gmp/
Source=		gmp-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = gmp-$(Version)

#GnuConfigureExtra += --enable-fat=yes
GnuConfigureExtra += --disable-cxx --disable-static

define build_inner_hook
mkdir $(BuildDir)/build-i386
cd $(BuildDir)/build-i386 ; ABI="32" CFLAGS="-arch i386 -Os" ../configure $(GnuConfigureExtra) ; $(make)
cd $(BuildDir) ; ABI="64" CFLAGS="-arch x86_64 -Os" $(gnu_configure) ; $(make)
cd $(BuildDir) ; for x in libgmp.10.dylib ; do \
	lipo -create -arch i386 build-i386/.libs/$$x -arch x86_64 .libs/$$x -output .libs/$$x ; done
endef

ifdef ONLY_STATIC_LIBS
GnuConfigureExtra += --enable-static --disable-shared
endif
