include ../../Library/GNU.mk

Title=		Gperftools
Name=		gperftools
Version=	2.0
Revision=	1
URL=		http://gperftools.googlecode.com/files/
Source=		$(Name)-$(Version).tar.gz


EnvExtra += MACOSX_DEPLOYMENT_TARGET=10.3

define test_inner_hook
$(BinDir)/pprof --version
endef
