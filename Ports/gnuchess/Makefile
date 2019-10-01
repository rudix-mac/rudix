include ../../Library/GNU.mk

Title=		GNU Chess
Name=		gnuchess
Version=	6.2.5
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/chess/gnuchess-$(Version).tar.gz
License=        GPLv3

define after_install_hook
mv $(DestDir)$(DataDir)/gnuchess/gnuchess.ini \
	$(DestDir)$(DataDir)/gnuchess/gnuchess.ini.default
endef

define test_hook
$(BinDir)/gnuchess --version | grep $(Version)
endef
