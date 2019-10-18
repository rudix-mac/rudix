include ../../Library/GNU.mk

Title=		GNU Screen
Name=		screen
Version=	4.4.0
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/$(Name)/$(Name)-$(Version).tar.gz
License=	GPLv3

GnuConfigureExtra += --with-sys-screenrc=/usr/local/etc
GnuConfigureExtra += -enable-telnet

define test_hook
$(BinDir)/screen --version | grep 'Screen version'
endef
