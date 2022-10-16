include ../../Library/Unix.mk

Title=          Ispell
Name=           ispell
Version=        3.4.05
Site=		https://www.cs.hmc.edu/~geoff/ispell.html
Source=		https://www.cs.hmc.edu/~geoff/tars/ispell-$(Version).tar.gz
License=	BSD-Like
LicenseFile=	LICENSE

MakeExtra += all

define build_hook
cd $(BuildDir) && cp local.h.bsd local.h && make all
endef

define test_hook
$(BinDir)/ispell -v | grep $(Version)
endef
