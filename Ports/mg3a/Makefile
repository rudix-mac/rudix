include ../../Library/Unix.mk

Title=		MG3a
Name=		mg3a
Version=	220529
Site=		https://github.com/paaguti
Source=		https://github.com/paaguti/$(Name)/archive/$(Version).tar.gz
License=	Public Domain

ReadMeFile=	$(SourceDir)/README

define build_hook
cd $(BuildDir) && $(MAKE)
endef

define install_hook
cd $(BuildDir) && $(MAKE) PREFIX="$(DestDir)/$(Prefix)" install
cp COPYING $(BuildDir)
endef

# define test_hook
# $(BinDir)/mg --help | grep $(Version)
# endef
