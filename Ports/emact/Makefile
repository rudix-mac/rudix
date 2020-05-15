include ../../Library/GNU.mk

Title=		emACT
Name=		emact
Version=	2.58.0
Site=		http://www.elegis.com/emacs
Source=		http://downloads.sourceforge.net/project/$(Name)/$(Name)-$(Version).tar.gz
License=        GPL

define test_hook
$(BinDir)/emact --version | grep $(Version)
endef

define configure_hook
endef

define build_hook
cd $(BuildDir) && ./configure && make -C src
endef

define install_hook
install -d $(DestDir)$(BinDir)
install -m 755 $(BuildDir)/emact $(DestDir)$(BinDir)
install -d $(DestDir)/usr/local/share/emact
install $(BuildDir)/lib/* $(DestDir)/usr/local/share/emact
install -d $(DestDir)/usr/local/share/doc/emact
install -m 755 $(BuildDir)/doc/* $(DestDir)/usr/local/share/doc/emact
endef
