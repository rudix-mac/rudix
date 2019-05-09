include ../../Library/Unix.mk

Title=		tstools
Name=		tstools
Version=	1.13
Site=		https://github.com/kynesim/tstools
Source=		https://github.com/kynesim/tstools/archive/master.zip
License=        MPL 1.1


UncompressedName = $(Name)-master
LdFlags += -lm
CFlags += -fPIC

define before_install_hook
tail -30 $(BuildDir)/docs/library.txt > $(BuildDir)/COPYING
endef

# define configure
# echo "Don't need to configure"
# endef

define test_hook
$(BinDir)/tstools --version | grep $(Version)
endef
