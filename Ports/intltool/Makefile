# Author: Qichang Liang <kcleung@cs.otago.ac.nz>

include ../../Library/GNU.mk

Title=		Internationalization Tool Collection
Name=		intltool
Version=	0.50.2
Site=		https://launchpad.net/intltool/
Source=		https://launchpad.net/intltool/trunk/0.50.2/+download//$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/intltool-extract --version | grep $(Version)
endef
