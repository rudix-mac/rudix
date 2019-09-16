include ../../Library/GNU.mk

Title=		GNU Autoconf
Name=		autoconf
Version=	2.69
Site=		https://www.gnu.org/software/$(Name)
Source=		http://ftpmirror.gnu.org/$(Name)/$(Name)-$(Version).tar.gz
License=	GPLv3+

define test_hook
$(BinDir)/autoconf --version | grep $(Version)
endef
