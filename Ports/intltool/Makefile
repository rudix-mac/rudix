# Author: Qichang Liang <kcleung@cs.otago.ac.nz>

include ../../Library/GNU.mk

Title=		Internationalization Tool Collection
Name=		intltool
Version=	0.50.2
Revision=	0
Site=		https://launchpad.net/intltool/
URL=		https://launchpad.net/intltool/trunk/0.50.2/+download/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

define test_inner_hook
$(BinDir)/intltool-extract --version | grep $(Version)
endef
