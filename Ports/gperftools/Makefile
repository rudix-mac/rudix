include ../../Library/GNU.mk

Title=		Gperftools
Name=		gperftools
Version=	2.1
Revision=	0
Site=		http://code.google.com/p/gperftools/
URL=		http://gperftools.googlecode.com/files/
Source=		$(Name)-$(Version).tar.gz
License=	BSD

EnvExtra += MACOSX_DEPLOYMENT_TARGET=10.3

define test_inner_hook
$(BinDir)/pprof --version
endef
