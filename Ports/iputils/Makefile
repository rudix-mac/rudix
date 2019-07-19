include ../../Library/GNU.mk

Title=		Iputils
Name=		iputils
Version=	s20151218
Site=		http://www.skbuff.net/iputils
Source=		http://www.skbuff.net/iputils/iputils-s20151218.tar.bz2
License=        GPL

MakeExtra += USE_CAP=no
MakeExtra += USE_IDN=yes

PatchLevel = -p1
define build_hook
cd $(BuildDir) && $(make) $(MakeExtra)
endef

define test_hook
$(BinDir)/iputils --version | grep $(Version)
endef
