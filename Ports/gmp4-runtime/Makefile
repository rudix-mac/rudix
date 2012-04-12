include ../../Library/GNU.mk

Title=		GNU MP (Version 4) [Runtime]
Name=		gmp4-runtime
Version=	4.3.2
Revision=	2
URL=		http://ftp.gnu.org/gnu/gmp/
Source=		gmp-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

UncompressedName = gmp-$(Version)

GnuConfigureExtra += --enable-cxx
GnuConfigureExtra += --enable-shared --disable-static

define build_inner_hook
mkdir $(BuildDir)/build-i386
cd $(BuildDir)/build-i386 ; ABI="32" CFLAGS="-arch i386 -Os" ../configure $(GnuConfigureExtra) ; $(make)
cd $(BuildDir) ; ABI="64" CFLAGS="-arch x86_64 -Os" $(gnu_configure) ; $(make)
cd $(BuildDir) ; for x in libgmp.3.5.2.dylib libgmpxx.4.1.2.dylib ; do \
	lipo -create -arch i386 build-i386/.libs/$$x -arch x86_64 .libs/$$x -output .libs/$$x ; done
endef

define install_post_hook
rm -rf $(InstallDir)/$(IncludeDir)
rm -rf $(InstallDir)/$(DataDir)/info
rm -f $(InstallDir)/$(LibDir)/*.la
rm -f $(InstallDir)/$(LibDir)/{libgmp.dylib,libgmpxx.dylib}
endef
