include ../../Library/Unix.mk

Title=		MG3a
Name=		mg3a
Version=	190113
Site=		https://github.com/paaguti
Source=		https://github.com/paaguti/$(Name)/archive/$(Version).tar.gz
License=	GPL

ReadMeFile=	$(SourceDir)/README

define build_hook
cd $(BuildDir) && $(MAKE)
endef

define install_hook
cd $(BuildDir) && $(MAKE) PREFIX="$(DestDir)/$(Prefix)" install
cp COPYING $(BuildDir)
endef

define test_hook
$(BinDir)/mg -v | grep $(Version)
endef
