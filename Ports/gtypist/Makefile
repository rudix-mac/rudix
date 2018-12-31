include ../../Library/GNU.mk

Title=		GNU Typist
Name=		gtypist
Version=	2.9.5
Site=		http://www.gnu.org/software/gtypist
Source=		https://ftp.gnu.org/gnu/gtypist/gtypist-$(Version).tar.xz
License=	GPLv3

# GnuConfigureExtra += --with-readline=/usr/local
LdFlags += -framework CoreFoundation -liconv

# Patches 
PatchLevel = -p1

define test_hook
$(BinDir)/gtypist --version | grep $(Version)
endef
