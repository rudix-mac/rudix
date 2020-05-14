include ../../Library/GNU.mk

Title=		emACT
Name=		emact
Version=	2.54.0
Site=		http://www.elegis.com/emacs
Source=		http://www.eligis.com/emacs/emact-$(Version).tar.gz
License=        GPL

define test_hook
$(BinDir)/emact --version | grep $(Version)
endef

define install_hook
install -d $(DestDir)$(BinDir)
install -m 755 $(BuildDir)/emact $(DestDir)$(BinDir)
install -d $(DestDir)/usr/local/share/emact
install $(BuildDir)/lib/* $(DestDir)/usr/local/share/emact
endef
