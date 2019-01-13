include ../../Library/GNU.mk

Title=		AtomicParsley
Name=		atomicparsley
Version=	0.9.6
Site=		https://bitbucket.org/wez/atomicparsley/overview
Source=		https://bitbucket.org/wez/atomicparsley/get/0.9.6.tar.bz2
License=        GPL

UncompressedName=	wez-atomicparsley-da2f6e4fc120

define build_pre_hook
cd ${BuildDir} ; ./autogen.sh
endef

GnuConfigureExtra += --disable-debug
GnuConfigureExtra += --disable-universal

#Patch from HomeBrew: https://raw.githubusercontent.com/Homebrew/formula-patches/ac8624c36e/atomicparsley/xcode9.patch
PatchLevel = -p1

ReadMeFile= ${BuildDir}/README.md
