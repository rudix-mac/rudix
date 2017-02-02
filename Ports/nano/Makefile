include ../../Library/GNU.mk

Title=		GNU nano
Name=		nano
Version=	2.2.6
Site=		http://www.nano-editor.org
Source=		http://ftp.gnu.org/gnu/nano//$(Name)-$(Version).tar.gz
License=	GPL

#GnuConfigureExtra += --enable-utf8

define test_hook
$(BinDir)/nano --version | grep $(Version)
endef
