include ../../Library/GNU.mk

Title=		GNU Chess
Name=		gnuchess
Version=	6.2.2
Site=		https://www.gnu.org/software/chess/
Source=		http://ftp.gnu.org/gnu/chess/gnuchess-$(Version).tar.gz
License=        GPL

define install_post_hook
mv $(InstallDir)$(DataDir)/gnuchess/gnuchess.ini \
	$(InstallDir)$(DataDir)/gnuchess/gnuchess.ini.default
endef

define test_hook
$(BinDir)/gnuchess --version | grep $(Version)
endef
