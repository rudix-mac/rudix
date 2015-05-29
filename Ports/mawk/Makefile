include ../../Library/GNU.mk

Title=		Mawk (AWK Programming Language)
Name=		mawk
Version=	1.3.4
Revision=	0
Site=		http://invisible-island.net/mawk/
Source=		http://invisible-island.net/datafiles/release/mawk.tar.gz
License=        GPLv2

UncompressedName=mawk-$(Version)-20150503

define test_inner_hook
$(BinDir)/mawk -W version | grep $(Version)
endef
