include ../../Library/GNU.mk

Title=		Gperftools
Name=		gperftools
Version=	2.3
Revision=	0
Site=		http://code.google.com/p/gperftools/
Source=		https://googledrive.com/host/0B6NtGsLhIcf7MWxMMF9JdTN3UVk/$(Name)-$(Version).tar.gz
License=	BSD

EnvExtra += MACOSX_DEPLOYMENT_TARGET=10.3

define test_inner_hook
$(BinDir)/pprof --version
endef
