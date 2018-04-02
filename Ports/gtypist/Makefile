include ../../Library/GNU.mk

Title=		GNU Typist
Name=		gtypist
Version=	2.9.5
Site=		http://www.gnu.org/software/gtypist
Source=		https://ftp.gnu.org/gnu/gtypist/gtypist-$(Version).tar.xz
License=	GPLv3

# GnuConfigureExtra += --with-readline=/usr/local
LdFlags += -framework CoreFoundation -liconv

define prep_post_hook
patch -p1 -d $(SourceDir) < patches/rudix.diff
endef

define install_post_hook
# rm -f $(InstallDir)/$(BinDir)/*-$(Version)
endef

define test_hook
# $(BinDir)/gawk --version | grep $(Version)
endef
