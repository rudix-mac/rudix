include ../../Library/GNU.mk

Title=		Patch utilities
Name=		patchutils
Version=	0.4.2
Site=		http://cyberelk.net/tim/software/patchutils/
Source=		http://cyberelk.net/tim/data/patchutils/stable/$(Name)-$(Version).tar.xz
License=	GPLv2

define test_hook
$(BinDir)/combinediff --version | grep $(Version)
endef
