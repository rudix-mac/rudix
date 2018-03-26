include ../../Library/GNU.mk

Title=		GNU Chess
Name=		gnuchess
Version=	6.2.5
Site=		https://www.gnu.org/software/chess/
Source=		https://ftp.gnu.org/gnu/chess/gnuchess-$(Version).tar.gz
License=        GPLv3

define install_post_hook
mv $(DestDir)$(DataDir)/gnuchess/gnuchess.ini \
	$(DestDir)$(DataDir)/gnuchess/gnuchess.ini.default
endef

define test_hook
$(BinDir)/gnuchess --version | grep $(Version)
endef
