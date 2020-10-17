include ../../Library/Configure.mk

Title=		RHash
Name=		rhash
Version=	1.4.0
Site=		https://github.com/rhash/RHash
Source=		https://github.com/rhash/RHash/archive/v$(Version).tar.gz
License=	BSD
ReadMeFile=	$(SourceDir)/README.md

define test_hook
$(BinDir)/rhash --version | grep $(Version)
endef
