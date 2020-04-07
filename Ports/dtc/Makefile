include ../../Library/Unix.mk

Title=		dtc
Name=		dtc
Version=	1.5.1
Site=		https://git.kernel.org/pub/scm/utils/dtc/dtc.git/
Source=		https://git.kernel.org/pub/scm/utils/dtc/dtc.git/snapshot/$(Name)-$(Version).tar.gz
License=	GPL
Description=	Device Tree Compiler
ReadMeFile=	$(SourceDir)/README
LicenseFile=    $(SourceDir)/GPL

define build_hook
cd $(BuildDir) && make
endef

define test_hook
$(BinDir)/$(Name) --version | grep $(Version)
endef
