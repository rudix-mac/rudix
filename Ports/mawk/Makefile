include ../../Library/GNU.mk

Title=		Mawk
Name=		mawk
Version=	1.3.4
Site=		http://invisible-island.net/mawk/
Source=		http://invisible-island.net/datafiles/release/mawk.tar.gz
License=        GPLv2

UncompressedName=mawk-$(Version)-20161120

define test_hook
$(BinDir)/mawk -W version | grep $(Version)
endef
