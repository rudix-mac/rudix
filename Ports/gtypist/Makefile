include ../../Library/GNU.mk

Title=		GNU Typist
Name=		gtypist
Version=	2.9.5
Site=		http://www.gnu.org/software/gtypist
Source=		https://ftp.gnu.org/gnu/gtypist/gtypist-$(Version).tar.xz
License=	GPLv3

# GnuConfigureExtra += --with-readline=/usr/local
LdFlags += -framework CoreFoundation -liconv

PatchLevel = -p1
# define after_prep_hook
# patch -p1 -d $(SourceDir) < patches/rudix.diff
# endef

define test_hook
$(BinDir)/gtypist --version | grep $(Version)
endef
