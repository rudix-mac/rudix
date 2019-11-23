include ../../Library/Unix.mk
BuildDepends += /usr/local/bin/ncursesw6-config

Title=		MG3a
Name=		mg3a
Version=	191107
Site=		https://github.com/paaguti
Source=		https://github.com/paaguti/$(Name)/archive/$(Version).tar.gz
License=	GPL

ReadMeFile=	$(SourceDir)/README
PatchLevel = -p1

GnuMakeExtras += COPT="-O3 $(shell ncursesw6-config --cflags)"
GnuMakeExtras += LIBS="$(shell ncursesw6-config --libs)"

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
