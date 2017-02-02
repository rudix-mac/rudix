include ../../Library/GNU.mk

Title=		Gperftools
Name=		gperftools
Version=	2.4
Site=		https://github.com/gperftools/gperftools/
Source=		https://github.com/gperftools/gperftools/releases/download/gperftools-$(Version)/gperftools-$(Version).tar.gz
License=	BSD

define test_hook
$(BinDir)/pprof --version
endef
