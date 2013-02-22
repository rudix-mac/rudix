# Suggested by Dann Luciano <dannluciano@gmail.com>

include ../../Library/GNU.mk

Title=		Valgrind
Name=		valgrind
Version=	3.8.1
Revision=	0
URL=		http://valgrind.org/downloads/
Source=		$(Name)-$(Version).tar.bz2


GnuConfigureExtra += --enable-only64bit
#GnuConfigureExtra += --enable-only32bit

define install_post_hook
find $(InstallDir) -name '*.dSYM' | xargs rm -rf
endef

define test_inner_hook
$(BinDir)/valgrind --version
endef
