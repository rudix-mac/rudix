# By suggestion of Dann Luciano <dannluciano@gmail.com>

include ../../Library/GNU.mk

Title=		Valgrind
Name=		valgrind
Version=	3.8.1
Revision=	1
Site=		http://valgrind.org/
Source=		http://valgrind.org/downloads//$(Name)-$(Version).tar.bz2
License=	GPL

ifeq ($(OSXVersion),10.6)
GnuConfigureExtra += --enable-only32bit
else
GnuConfigureExtra += --enable-only64bit
endif

define install_post_hook
find $(InstallDir) -name '*.dSYM' | xargs rm -rf
endef

define test_inner_hook
$(BinDir)/valgrind --version | grep $(Version)
endef
