# Author: Qichang Liang <kcleung@cs.otago.ac.nz>

include ../../Library/GNU.mk

Title=		Internationalization Tool Collection
Name=		intltool
Version=	0.51.0
Site=		https://launchpad.net/intltool/
Source=		https://launchpad.net/intltool/trunk/$(Version)/+download/$(Name)-$(Version).tar.gz
License=	GPL

define test_hook
$(BinDir)/intltool-extract --version | grep $(Version)
endef
