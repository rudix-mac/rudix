include ../../Library/GNU.mk
#BuildDepends += /usr/local/bin/ncursesw6-config

Title=		MG3a
Name=		mg3a
Version=	191206
Site=		https://github.com/paaguti
Source=		https://github.com/paaguti/$(Name)/archive/$(Version).tar.gz
License=	GPL

ReadMeFile=	$(SourceDir)/README
PatchLevel = -p1

define before_build_hook
cd $(BuildDir) && ./bootstrap.sh
endef

define test_hook
$(BinDir)/mg -v | grep $(Version)
endef
