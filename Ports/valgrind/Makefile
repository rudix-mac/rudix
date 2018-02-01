# By suggestion of Dann Luciano <dannluciano@gmail.com>

include ../../Library/GNU.mk

Title=		Valgrind
Name=		valgrind
Version=	3.8.1
Site=		http://valgrind.org/
Source=		http://valgrind.org/downloads//$(Name)-$(Version).tar.bz2
License=	GPL

GnuConfigureExtra += --enable-only64bit

define install_post_hook
find $(InstallDir) -name '*.dSYM' | xargs rm -rf
endef

define test_hook
$(BinDir)/valgrind --version | grep $(Version)
endef
