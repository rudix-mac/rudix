# By suggestion of Dann Luciano <dannluciano@gmail.com>

include ../../Library/GNU.mk

Title=		Valgrind
Name=		valgrind
Version=	3.8.1
Revision=	1
URL=		http://valgrind.org/downloads/
Source=		$(Name)-$(Version).tar.bz2

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
